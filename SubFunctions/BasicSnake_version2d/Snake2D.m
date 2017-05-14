function [P,J]=Snake2D(I,P,Options)
% This function SNAKE implements the basic snake segmentation. A snake is an 
% active (moving) contour, in which the points are attracted by edges and
% other boundaries. To keep the contour smooth, an membrame and thin plate
% energy is used as regularization.
%
% [O,J]=Snake2D(I,P,Options)
%  
% inputs,
%   I : An Image of type double preferable ranged [0..1]
%   P : List with coordinates descriping the rough contour N x 2
%   Options : A struct with all snake options
%   
% outputs,
%   O : List with coordinates of the final contour M x 2
%   J : Binary image with the segmented region

% Process inputs
defaultoptions=struct('Verbose',false,'nPoints',100,'Wline',0.04,'Wedge',2,'Wterm',0.01,'Sigma1',10,'Sigma2',20,'Alpha',0.2,'Beta',0.2,'Delta',0.1,'Gamma',1,'Kappa',2,'Iterations',100,'GIterations',0,'Mu',0.2,'Sigma3',1);
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

% Convert input to double
I = double(I);

% If color image convert to grayscale
if(size(I,3)==3), I=rgb2gray(I); end

% The contour must always be clockwise (because of the balloon force)
P=MakeContourClockwise2D(P);

% Make an uniform sampled contour description
P=InterpolateContourPoints2D(P,Options.nPoints);

% Transform the Image into an External Energy Image
Eext = ExternalForceImage2D(I,Options.Wline, Options.Wedge, Options.Wterm,Options.Sigma1);

% Make the external force (flow) field.
Fx=ImageDerivatives2D(Eext,Options.Sigma2,'x');
Fy=ImageDerivatives2D(Eext,Options.Sigma2,'y');
Fext(:,:,1)=-Fx*2*Options.Sigma2^2;
Fext(:,:,2)=-Fy*2*Options.Sigma2^2;

% Do Gradient vector flow, optimalization
Fext=GVFOptimizeImageForces2D(Fext, Options.Mu, Options.GIterations, Options.Sigma3);

% Show the image, contour and force field
if(Options.Verbose)
    h=figure; set(h,'render','opengl')
     subplot(2,2,1),
      imshow(I,[]); 
      hold on; plot(P(:,2),P(:,1),'b.'); hold on;
      title('The image with initial contour')
     subplot(2,2,2),
      imshow(Eext,[]); 
      title('The external energy');
     subplot(2,2,3), 
      [x,y]=ndgrid(1:10:size(Fext,1),1:10:size(Fext,2));
      imshow(I), hold on; quiver(y,x,Fext(1:10:end,1:10:end,2),Fext(1:10:end,1:10:end,1));
      title('The external force field ')
     subplot(2,2,4), 
      imshow(I), hold on; plot(P(:,2),P(:,1),'b.'); 
      title('Snake movement ')
    drawnow
end


% Make the interal force matrix, which constrains the moving points to a
% smooth contour
S=SnakeInternalForceMatrix2D(Options.nPoints,Options.Alpha,Options.Beta,Options.Gamma);
h=[];
for i=1:Options.Iterations
    P=SnakeMoveIteration2D(S,P,Fext,Options.Gamma,Options.Kappa,Options.Delta);

    % Show current contour
    if(Options.Verbose)
        if(ishandle(h)), delete(h), end
        h=plot(P(:,2),P(:,1),'r.');
        c=i/Options.Iterations;
        plot([P(:,2);P(1,2)],[P(:,1);P(1,1)],'-','Color',[c 1-c 0]);  drawnow
    end
end

if(nargout>1)
     J=DrawSegmentedArea2D(P,size(I));
end

