function varargout = E200_DAQ_GUI(varargin)
% E200_DAQ_GUI M-file for E200_DAQ_GUI.fig
%      E200_DAQ_GUI, by itself, creates a new E200_DAQ_GUI or raises the existing
%      singleton*.
%
%      H = E200_DAQ_GUI returns the handle to a new E200_DAQ_GUI or the handle to
%      the existing singleton*.
%
%      E200_DAQ_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in E200_DAQ_GUI.M with the given input arguments.
%
%      E200_DAQ_GUI('Property','Value',...) creates a new E200_DAQ_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before E200_DAQ_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to E200_DAQ_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help E200_DAQ_GUI

% Last Modified by GUIDE v2.5 19-Dec-2013 14:11:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @E200_DAQ_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @E200_DAQ_GUI_OutputFcn, ...
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


% --- Executes just before E200_DAQ_GUI is made visible.
function E200_DAQ_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to E200_DAQ_GUI (see VARARGIN)

% Choose default command line output for E200_DAQ_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

%addpath('/usr/local/facet/tools/matlab/toolbox/facet_daq/E200_DAQ_GUI_path/');
% addpath('/home/fphysics/joelfred/matlab_mv/toolbox/facet_daq');
handles=scanDefaults(hObject,handles);

% guidata(hObject,handles);

camlist = cam_list();
handles.camlist=camlist;
% str = [strcat(num2str(cell2mat(camlist(:,4))), ' - ', 	camlist(:,1))];
set(handles.Cameralist,'String',camlist.AD_CAMS.NAMES);
% display(get(handles.Cameralist,'Value'));
% camind = find(cell2mat(camlist(:,3)));
% set(handles.Cameralist,'Value',camind');

camdisplay(handles);
guidata(hObject,handles);
global hl;
hl=handles;

% UIWAIT makes E200_DAQ_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = E200_DAQ_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ExperimentStr_Callback(hObject, eventdata, handles)
% hObject    handle to ExperimentStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ExperimentStr as text
%        str2double(get(hObject,'String')) returns contents of ExperimentStr as a double


% --- Executes during object creation, after setting all properties.
function ExperimentStr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ExperimentStr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Cameralist.
function Cameralist_Callback(hObject, eventdata, handles)
% hObject    handle to Cameralist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns Cameralist contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Cameralist

% display(get(hObject,'Value'))
camdisplay(handles)


% --- Executes during object creation, after setting all properties.
function Cameralist_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Cameralist (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Rundaq.
function Rundaq_Callback(hObject, eventdata, handles)
% hObject    handle to Rundaq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

rundaq(handles);

function Commentstring_Callback(hObject, eventdata, handles)
% hObject    handle to Commentstring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Commentstring as text
%        str2double(get(hObject,'String')) returns contents of Commentstring as a double


% --- Executes during object creation, after setting all properties.
function Commentstring_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Commentstring (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Savefacet.
function Savefacet_Callback(hObject, eventdata, handles)
% hObject    handle to Savefacet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Savefacet


% --- Executes on button press in SaveE200.
function SaveE200_Callback(hObject, eventdata, handles)
% hObject    handle to SaveE200 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of SaveE200


% --- Executes on button press in Savebackground.
function Savebackground_Callback(hObject, eventdata, handles)
% hObject    handle to Savebackground (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Savebackground



function Numberofshots_Callback(hObject, eventdata, handles)
% hObject    handle to Numberofshots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Numberofshots as text
%        str2double(get(hObject,'String')) returns contents of Numberofshots as a double


% --- Executes during object creation, after setting all properties.
function Numberofshots_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Numberofshots (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Print2elog.
function Print2elog_Callback(hObject, eventdata, handles)
% hObject    handle to Print2elog (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Print2elog


% --- Executes on button press in AIDAdaq.
function AIDAdaq_Callback(hObject, eventdata, handles)
% hObject    handle to AIDAdaq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of AIDAdaq


% --- Executes on button press in Daqscan.
function Daqscan_Callback(hObject, eventdata, handles)
% hObject    handle to Daqscan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Daqscan

% Enable scan controls
enableDAQ(handles);




% --- Executes on selection change in Scanfunction.
function Scanfunction_Callback(hObject, eventdata, handles)
% hObject    handle to Scanfunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns Scanfunction contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Scanfunction

handles=scanDefaults(hObject,handles);

switch get(handles.Scanfunction,'Value')
    case {1,2,3,5}
        set(handles.Setfunctionval,'Enable','on');
        set(handles.Setfunction,'Enable','on');
    case 4
        set(handles.Setfunctionval,'Enable','off');
        set(handles.Setfunction,'Enable','off');
end
        
        


% --- Executes during object creation, after setting all properties.
function Scanfunction_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scanfunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Scanstartval_Callback(hObject, eventdata, handles)
% hObject    handle to Scanstartval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scanstartval as text
%        str2double(get(hObject,'String')) returns contents of Scanstartval as a double

Setscanval(handles);


% --- Executes during object creation, after setting all properties.
function Scanstartval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scanstartval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Scanendval_Callback(hObject, eventdata, handles)
% hObject    handle to Scanendval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scanendval as text
%        str2double(get(hObject,'String')) returns contents of Scanendval as a double

Setscanval(handles);


% --- Executes during object creation, after setting all properties.
function Scanendval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scanendval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Scanstepsval_Callback(hObject, eventdata, handles)
% hObject    handle to Scanstepsval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scanstepsval as text
%        str2double(get(hObject,'String')) returns contents of Scanstepsval as a double

Setscanval(handles);


% --- Executes during object creation, after setting all properties.
function Scanstepsval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scanstepsval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Scanvaluesstr_Callback(hObject, eventdata, handles)
% hObject    handle to Scanvaluesstr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Scanvaluesstr as text
%        str2double(get(hObject,'String')) returns contents of Scanvaluesstr as a double


% --- Executes during object creation, after setting all properties.
function Scanvaluesstr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Scanvaluesstr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function Setfunctionval_Callback(hObject, eventdata, handles)
% hObject    handle to Setfunctionval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Setfunctionval as text
%        str2double(get(hObject,'String')) returns contents of Setfunctionval as a double


% --- Executes during object creation, after setting all properties.
function Setfunctionval_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Setfunctionval (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Setfunction.
function Setfunction_Callback(hObject, eventdata, handles)
% hObject    handle to Setfunction (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.func(str2num(get(handles.Setfunctionval,'String')));


% --- Executes on button press in UseCMOS.
% function UseCMOS_Callback(hObject, eventdata, handles)
% % hObject    handle to UseCMOS (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hint: get(hObject,'Value') returns toggle state of UseCMOS
% if get(hObject,'Value')
%     cameras = get(handles.Cameralist,'String');
%     cameras = [cameras; 'CMOS'];
%     set(handles.Cameralist,'String',cameras);
% else
%     cameras = get(handles.Cameralist,'String');
%     cm_ind = strcmp('CMOS',cameras);
%     cameras = cameras(~cm_ind);
%     set(handles.Cameralist,'String',cameras);
% end



function camDisplay_Callback(hObject, eventdata, handles)
% hObject    handle to camDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of camDisplay as text
%        str2double(get(hObject,'String')) returns contents of camDisplay as a double


% --- Executes during object creation, after setting all properties.
function camDisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to camDisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


