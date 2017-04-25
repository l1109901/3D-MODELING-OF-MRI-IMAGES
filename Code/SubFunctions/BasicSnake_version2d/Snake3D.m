function FV=Snake3D(I,FV,Options)
% This function SNAKE implements the basic snake segmentation. A snake is an 
% active (moving) contour, in which the points are attracted by edges and
% other boundaries. To keep the contour smooth, an membrame and thin plate
% energy is used as regularization.
%
% OV=Snake3D(I,FV,Options)
%  
% inputs,
%   I : An Image of type double preferable ranged [0..1]
%   FV : Structure with triangulated mesh, with list of faces FV.faces N x 3
%        and list of vertices M x 3
%   Options : A struct with all snake options
%   
% outputs,
%   OV : Structure with triangulated mesh of the final surface

% Process inputs
defaultoptions=struct('Verbose',false,'Wline',0.04,'Wedge',2,'Sigma1',2,'Sigma2',2,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1,'Lambda',0.8);
if(~exist('Options','var')), 
    Options=defaultoptions; 
else
    tags = fieldnames(defaultoptions);
    for i=1:length(tags)
         if(~isfield(Options,tags{i})), Options.(tags{i})=defaultoptions.(tags{i}); end
    end
    if(length(tags)~=length(fieldnames(Options))), 
        warning('snake:unknownoption','unknown options found');
    end
end

% Convert input to single if xintxx
if(~strcmpi(class(I),'single')&&~strcmpi(class(I),'double'))
    I=single(I);
end

% The surface faces must always be clockwise (because of the balloon force)
FV=MakeContourClockwise3D(FV);

% Transform the Image into an External Energy Image
Eext = ExternalForceImage3D(I,Options.Wline, Options.Wedge,Options.Sigma1);

% Make the external force (flow) field.
Fx=ImageDerivatives3D(Eext,Options.Sigma2,'x');
Fy=ImageDerivatives3D(Eext,Options.Sigma2,'y');
Fz=ImageDerivatives3D(Eext,Options.Sigma2,'z');

Fext(:,:,:,1)=-Fx*2*Options.Sigma2^2;
Fext(:,:,:,2)=-Fy*2*Options.Sigma2^2;
Fext(:,:,:,3)=-Fz*2*Options.Sigma2^2;

% Do Gradient vector flow, optimalization
Fext=GVFOptimizeImageForces3D(Fext, Options.Mu, Options.GIterations, Options.Sigma3);

% Show the image, contour and force field
if(Options.Verbose)
     drawnow; pause(0.1);
     h=figure; set(h,'render','opengl')
     subplot(2,3,1),imshow(squeeze(Eext(:,:,round(end/2))),[]);
     subplot(2,3,2),imshow(squeeze(Eext(:,round(end/2),:)),[]);
     subplot(2,3,3),imshow(squeeze(Eext(round(end/2),:,:)),[]);
     subplot(2,3,4),imshow(squeeze(Fext(:,:,round(end/2),:))+0.5);
     subplot(2,3,5),imshow(squeeze(Fext(:,round(end/2),:,:))+0.5);
     subplot(2,3,6),imshow(squeeze(Fext(round(end/2),:,:,:))+0.5);
     h=figure; set(h,'render','opengl'); hold on;
     %patch(i,'facecolor',[1 0 0],'facealpha',0.1);
     ind=find(I(:)>0);
     [ix,iy,iz]=ind2sub(size(Eext),ind);
     plot3(ix,iy,iz,'b.');
     hold on;
     h=patch(FV,'facecolor',[1 0 0],'facealpha',0.1);
     drawnow; pause(0.1);
end

% Make the interal force matrix, which constrains the moving points to a
% smooth contour
S=SnakeInternalForceMatrix3D(FV,Options.Alpha,Options.Beta,Options.Gamma);
for i=1:Options.Iterations
    FV=SnakeMoveIteration3D(S,FV,Fext,Options.Gamma,Options.Kappa,Options.Delta,Options.Lambda);

    % Show current contour
    if(Options.Verbose)
        if(ishandle(h));
            delete(h);
            h=patch(FV,'facecolor',[1 0 0],'facealpha',0.1);
            drawnow; %pause(0.1);
        end
    end
end


