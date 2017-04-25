function varargout = analyzer3d_console(varargin)
% analyzer3d_CONSOLE M-file for analyzer3d_console.fig
%      analyzer3d_CONSOLE, by itself, creates a new analyzer3d_CONSOLE or raises the existing
%      singleton*.
%
%      H = analyzer3d_CONSOLE returns the handle to a new analyzer3d_CONSOLE or the handle to
%      the existing singleton*.
%
%      analyzer3d_CONSOLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in analyzer3d_CONSOLE.M with the given input arguments.
%
%      analyzer3d_CONSOLE('Property','Value',...) creates a new analyzer3d_CONSOLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before analyzer3d_console_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to analyzer3d_console_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help analyzer3d_console

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @analyzer3d_console_OpeningFcn, ...
                   'gui_OutputFcn',  @analyzer3d_console_OutputFcn, ...
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


% --- Executes just before analyzer3d_console is made visible.
function analyzer3d_console_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to analyzer3d_console (see VARARGIN)

% Choose default command line output for analyzer3d_console
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = analyzer3d_console_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_console_Callback(hObject, eventdata, handles)
% hObject    handle to edit_console (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_console as text
%        str2double(get(hObject,'String')) returns contents of edit_console as a double


% --- Executes during object creation, after setting all properties.
function edit_console_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_console (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button_clear.
function button_clear_Callback(hObject, eventdata, handles)
% hObject    handle to button_clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
