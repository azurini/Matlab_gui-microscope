function varargout = mindcontrol(varargin)
% MINDCONTROL MATLAB code for mindcontrol.fig
%      MINDCONTROL, by itself, creates a new MINDCONTROL or raises the existing
%      singleton*.
%
%      H = MINDCONTROL returns the handle to a new MINDCONTROL or the handle to
%      the existing singleton*.
%
%      MINDCONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINDCONTROL.M with the given input arguments.
%
%      MINDCONTROL('Property','Value',...) creates a new MINDCONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mindcontrol_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mindcontrol_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mindcontrol

% Last Modified by GUIDE v2.5 16-Apr-2018 23:13:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mindcontrol_OpeningFcn, ...
                   'gui_OutputFcn',  @mindcontrol_OutputFcn, ...
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

% --- Executes just before mindcontrol is made visible.
function mindcontrol_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mindcontrol (see VARARGIN)

% Choose default command line output for mindcontrol
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global aa II
% This sets up the initial plot - only do when we are invisible
% so window can get raised using mindcontrol.
if strcmp(get(hObject,'Visible'),'off')
    I=imread('IMG_2873.jpg');
    I=I(1:510,1:510,1:3);
    imwrite(I,'sqrt.jpg');
    imshow(I);
    for i=1:1:510
    for j=1:1:510
        II(i,j)=sqrt((i-255).^2+(j-255).^2);
    end
    end
end
aa=find(II>100);

% UIWAIT makes mindcontrol wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mindcontrol_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
global aa II
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        I=imread('sqrt.jpg');
        aa=find(II>50);
        I(aa)=0;
        I(aa+260100)=0;
        I(aa+260100+260100)=0;
        imshow(I)
    case 2
        I=imread('sqrt.jpg');
        aa=find(II>100);
        I(aa)=0;
        I(aa+260100)=0;
        I(aa+260100+260100)=0;
        imshow(I)
    case 3
        I=imread('sqrt.jpg');
        aa=find(II>150);
        I(aa)=0;
        I(aa+260100)=0;
        I(aa+260100+260100)=0;
        imshow(I)
    case 4
        I=imread('sqrt.jpg');
        aa=find(II>200);
        I(aa)=0;
        I(aa+260100)=0;
        I(aa+260100+260100)=0;
        imshow(I)
    case 5
        I=imread('sqrt.jpg');
        aa=find(II>250);
        I(aa)=0;
        I(aa+260100)=0;
        I(aa+260100+260100)=0;
        imshow(I)
end


% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'视窗1', '视窗2', '视窗3', '视窗4', '视窗5'});
