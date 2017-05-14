function varargout = analyzer3d_qualityspeed(varargin)
% analyzer3d_QUALITYSPEED M-file for analyzer3d_qualityspeed.fig
%      analyzer3d_QUALITYSPEED, by itself, creates a new analyzer3d_QUALITYSPEED or raises the existing
%      singleton*.
%
%      H = analyzer3d_QUALITYSPEED returns the handle to a new analyzer3d_QUALITYSPEED or the handle to
%      the existing singleton*.
%
%      analyzer3d_QUALITYSPEED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in analyzer3d_QUALITYSPEED.M with the given input arguments.
%
%      analyzer3d_QUALITYSPEED('Property','Value',...) creates a new analyzer3d_QUALITYSPEED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyzer3d_qualityspeed_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyzer3d_qualityspeed_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyzer3d_qualityspeed


% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyzer3d_qualityspeed_OpeningFcn, ...
                   'gui_OutputFcn',  @analyzer3d_qualityspeed_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before analyzer3d_qualityspeed is made visible.
function analyzer3d_qualityspeed_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyzer3d_qualityspeed (see VARARGIN)

% Choose default command line output for analyzer3d_qualityspeed
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes analyzer3d_qualityspeed wait for user response (see UIRESUME)
% uiwait(handles.figurequalityspeed);


% --- Outputs from this function are returned to the command line.
function varargout = analyzer3d_qualityspeed_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in checkbox_prerender.
function checkbox_prerender_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_prerender (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_prerender


% --- Executes on button press in radiobutton_scaling25.
function radiobutton_scaling25_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_scaling25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_scaling25


% --- Executes on button press in radiobutton_scaling50.
function radiobutton_scaling50_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_scaling50 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_scaling50


% --- Executes on button press in radiobutton_scaling100.
function radiobutton_scaling100_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_scaling100 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_scaling100


% --- Executes on button press in radiobutton_scaling200.
function radiobutton_scaling200_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton_scaling200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton_scaling200


% --- Executes on button press in checkbox_storexyz.
function checkbox_storexyz_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox_storexyz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox_storexyz


% --- Executes on button press in pushbutton_applyconfig.
function pushbutton_applyconfig_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_applyconfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton_saveconfig.
function pushbutton_saveconfig_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_saveconfig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
