function varargout = ctTherm(varargin)
% CTTHERM MATLAB code for ctTherm.fig
%      CTTHERM, by itself, creates a new CTTHERM or raises the existing
%      singleton*.
%
%      H = CTTHERM returns the handle to a new CTTHERM or the handle to
%      the existing singleton*.
%
%      CTTHERM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CTTHERM.M with the given input arguments.
%
%      CTTHERM('Property','Value',...) creates a new CTTHERM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ctTherm_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ctTherm_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ctTherm

% Last Modified by GUIDE v2.5 04-Aug-2015 16:11:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ctTherm_OpeningFcn, ...
                   'gui_OutputFcn',  @ctTherm_OutputFcn, ...
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


% --- Executes just before ctTherm is made visible.
function ctTherm_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ctTherm (see VARARGIN)

addpath('niftiIO');
addpath('imtool3D');
import java.util.ArrayList;
javaaddpath('SlidingWindow\dist\SlidingWindow.jar');
javaaddpath('SlidingWindow\build\classes\slidingwindow');
ctThermConfig;

% Choose default command line output for ctTherm
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ctTherm wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ctTherm_OutputFcn(hObject, eventdata, handles) 
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
[niiFile,parentDir] = uigetfile('*.nii','Select Baseline Nifty File');
imgData = initializeNIIfileWithDCMData(parentDir,niiFile);
assignin('base','baselineScan',imgData);
set(handles.edit1,'String',strcat(parentDir,niiFile));


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    imtool3D(evalin('base','baselineScan'));
catch
    msgbox('Please load baseline NII scan first');
end


% --- Executes during object creation, after setting all properties.
function text1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text1.
function text1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[niiFile,parentDir] = uigetfile('*.nii','Select Comparison Nifty File');
imgData = initializeNIIfileWithDCMData(parentDir,niiFile);
assignin('base','comparisonScan',imgData);
set(handles.edit2,'String',strcat(parentDir,niiFile));

% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    imtool3D(evalin('base','comparisonScan'));
catch
    msgbox('Please load comparison NII scan first');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baselineDCMfolder = uigetdir('','Select Comparison Scan DICOM folder');
set(handles.edit3,'String',baselineDCMfolder);
[dcmFixedHU,outputFilePath] = saveDICOMfolder(baselineDCMfolder);
assignin('base','baselineScan',dcmFixedHU);
set(handles.edit1,'String',outputFilePath);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    inputFolder = evalin('base','baselineDCMfolder');
    if( inputFolder(end)~='\' )
       inputFolder = strcat(inputFolder,'\'); 
    end
    [outputFileName,outputFilePath] = uiputfile('*.nii','Save NII file of Baseline Scan');
    fullFilePath = strcat(outputFilePath,outputFileName);
    dcmHU = writeNIIfile(inputFolder,fullFilePath);

    assignin('base','baselineScan',dcmHU);
    set(handles.edit1,'String',fullFilePath);
    
catch
    msgbox('Please specify baseline DICOM folder first');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
comparisonDCMfolder = uigetdir('','Select Comparison Scan DICOM folder');
set(handles.edit4,'String',comparisonDCMfolder);
[dcmFixedHU,outputFilePath] = saveDICOMfolder(comparisonDCMfolder);
assignin('base','comparisonScan',dcmFixedHU);
set(handles.edit2,'String',outputFilePath);


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputFolder = evalin('base','comparisonDCMfolder');
[dcmFixedHU,outputFilePath] = saveDICOMfolder(inputFolder);
assignin('base','comparisonScan',dcmFixedHU);
set(handles.edit2,'String',outputFilePath);


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baselineFile = get(handles.edit1,'String');
comparisonFile = get(handles.edit2,'String');
[cmdName,batchFilePath] = writeNIIbatchScript(baselineFile,comparisonFile);
assignin('base','batchScriptCommand',cmdName);
set(handles.edit5,'String',batchFilePath);


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
runCommand = evalin('base','batchScriptCommand');
system(runCommand);



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
baseScan = evalin('base','baselineScan');
HUthreshold = evalin('base','HUthreshold');
pointsThreshold = evalin('base','pointsThreshold');
minNumNeedles = evalin('base','minNumNeedles');
roiRadius = evalin('base','roiRadius');
[outputROI,minCoordsAll,maxCoordsAll] = getROIregions(baseScan, HUthreshold,pointsThreshold,minNumNeedles,roiRadius );

numROIregions = numel(outputROI);
outputName = cell(1,numROIregions);
minCoordArray = cell(1,numROIregions);
maxCoordArray = cell(1,numROIregions);
index = 1;
for j = 1:size(outputROI,1)
    outputName{index} = strcat('Needle_',num2str(j),'_Tip');
    minCoordArray{index} = minCoordsAll{j,1};
    maxCoordArray{index} = maxCoordsAll{j,1};
    index = index+1;
end
for j = 1:size(outputROI,1)
    outputName{index} = strcat('Needle_',num2str(j),'_Other End'); 
    minCoordArray{index} = minCoordsAll{j,2};
    maxCoordArray{index} = maxCoordsAll{j,2};
    index = index+1;
end

assignin('base','outputROInames',outputName);
assignin('base','roiMinCoords',minCoordArray);
assignin('base','roiMaxCoords',maxCoordArray);

assignin('base','roiIndex',1);
set(handles.listbox1,'String',outputName,'Value',1);

minCoords = minCoordArray{1};
set(handles.edit6,'String',minCoords(1));
set(handles.edit9,'String',minCoords(2));
set(handles.edit11,'String',minCoords(3));

maxCoords = maxCoordArray{1};
set(handles.edit8,'String',maxCoords(1));
set(handles.edit10,'String',maxCoords(2));
set(handles.edit12,'String',maxCoords(3));

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end




% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
indexSelected = get(hObject,'Value');
assignin('base','roiIndex',indexSelected);

minCoordsArray = evalin('base','roiMinCoords');
minCoords = minCoordsArray{indexSelected};
set(handles.edit6,'String',minCoords(1));
set(handles.edit9,'String',minCoords(2));
set(handles.edit11,'String',minCoords(3));

maxCoordsArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordsArray{indexSelected};
set(handles.edit8,'String',maxCoords(1));
set(handles.edit10,'String',maxCoords(2));
set(handles.edit12,'String',maxCoords(3));

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
rowMin = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

minCoordArray = evalin('base','roiMinCoords');
minCoords = minCoordArray{roiIndex};
minCoords(1) = rowMin;

minCoordArray{roiIndex} = minCoords;
assignin('base','roiMinCoords',minCoordArray);

maxCoordsArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double
rowMax = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

maxCoordArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordArray{roiIndex};
maxCoords(1) = rowMax;

maxCoordArray{roiIndex} = maxCoords;
assignin('base','roiMaxCoords',maxCoordArray);

minCoordsArray = evalin('base','roiMinCoords');
minCoords = minCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
colMin = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

minCoordArray = evalin('base','roiMinCoords');
minCoords = minCoordArray{roiIndex};
minCoords(2) = colMin;

minCoordArray{roiIndex} = minCoords;
assignin('base','roiMinCoords',minCoordArray);

maxCoordsArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end



% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
colMax = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

maxCoordArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordArray{roiIndex};
maxCoords(2) = colMax;

maxCoordArray{roiIndex} = maxCoords;
assignin('base','roiMaxCoords',maxCoordArray);

minCoordsArray = evalin('base','roiMinCoords');
minCoords = minCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
sliceMin = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

minCoordArray = evalin('base','roiMinCoords');
minCoords = minCoordArray{roiIndex};
minCoords(3) = sliceMin;

minCoordArray{roiIndex} = minCoords;
assignin('base','roiMinCoords',minCoordArray);

maxCoordsArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double
sliceMax = floor(str2double(get(hObject,'String')));
roiIndex = evalin('base','roiIndex');

maxCoordArray = evalin('base','roiMaxCoords');
maxCoords = maxCoordArray{roiIndex};
maxCoords(3) = sliceMax;

maxCoordArray{roiIndex} = maxCoords;
assignin('base','roiMaxCoords',maxCoordArray);

minCoordsArray = evalin('base','roiMinCoords');
minCoords = minCoordsArray{roiIndex};

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton13.
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool3D(evalin('base','currentBaseROI'));


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool3D(evalin('base','currentComparisonROI'));



% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
try
    outputName = evalin('base','outputROInames');
    minCoordArray = evalin('base','roiMinCoords');
    maxCoordArray = evalin('base','roiMaxCoords');
catch
    outputName = [];
    minCoordArray = [];
    maxCoordArray = [];
end

numROI = numel(outputName);
nextROIn = evalin('base','nextManualROInum');
outputName{numROI+1} = strcat('Manual_ROI_',num2str(nextROIn));
assignin('base','nextManualROInum',nextROIn+1);
set(handles.listbox1,'String',outputName);

baseScan = evalin('base','baselineScan');

minCoordArray{numROI+1}=[1 1 1];
maxCoordArray{numROI+1}=size(baseScan);

assignin('base','outputROInames',outputName);
assignin('base','roiMinCoords',minCoordArray);
assignin('base','roiMaxCoords',maxCoordArray);

minCoords = [1 1 1];
set(handles.edit6,'String',minCoords(1));
set(handles.edit9,'String',minCoords(2));
set(handles.edit11,'String',minCoords(3));

maxCoords = size(baseScan);
set(handles.edit8,'String',maxCoords(1));
set(handles.edit10,'String',maxCoords(2));
set(handles.edit12,'String',maxCoords(3));

baselineScan = evalin('base','baselineScan');
assignin('base','currentBaseROI',baselineScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
try
    comparisonScan = evalin('base','comparisonScan');
    assignin('base','currentComparisonROI',...
        comparisonScan(...
        minCoords(1):maxCoords(1),...
        minCoords(2):maxCoords(2),...
        minCoords(3):maxCoords(3)));
catch 
end


% --- Executes on button press in pushbutton17.
function pushbutton17_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fullFilePath = strcat(pwd,'\results\convDiffROI',makeDateTimeString(),'.nii');
diffROIConv = getConvDiffROI( evalin('base','currentBaseROI'),...
    evalin('base','currentComparisonROI'),evalin('base','fSize') );
saveScanAsNII(diffROIConv,fullFilePath);
assignin('base','convDiffROI',diffROIConv);
set(handles.edit13,'String',fullFilePath);


% --- Executes on button press in pushbutton18.
function pushbutton18_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool3D(evalin('base','convDiffROI'));


function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton19.
function pushbutton19_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton19 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
fullFilePath = strcat(pwd,'\results\spatialOffsetROI',makeDateTimeString(),'.nii');
spatialOffsetRMSE = getSlidingWindowBlockJava( evalin('base','currentBaseROI'),...
    evalin('base','currentComparisonROI'),evalin('base','fSize') );
saveScanAsNII(spatialOffsetRMSE,fullFilePath);
assignin('base','spatialOffsetROI',spatialOffsetRMSE);
set(handles.edit14,'String',fullFilePath);


% --- Executes on button press in pushbutton20.
function pushbutton20_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool3D(evalin('base','spatialOffsetROI'));



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton21.
function pushbutton21_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[niiFile,parentDir] = uigetfile('*.nii','Select Spatial Offset RMSE Nifty File');
imgData = initializeNIIfile(parentDir,niiFile);
assignin('base','spatialOffsetROI',imgData);
set(handles.edit14,'String',strcat(parentDir,niiFile));


% --- Executes on button press in pushbutton22.
function pushbutton22_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[niiFile,parentDir] = uigetfile('*.nii','Select Conv Diff Nifty File');
imgData = initializeNIIfile(parentDir,niiFile);
assignin('base','convDiffROI',imgData);
set(handles.edit13,'String',strcat(parentDir,niiFile));


% --- Executes on selection change in listbox3.
function listbox3_Callback(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: contents = cellstr(get(hObject,'String')) returns listbox3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox3
indexSelected = get(hObject,'Value');

tempPointCoords = evalin('base','tempPointCoords');
tempPoint = tempPointCoords{indexSelected};
set(handles.edit24,'String',tempPoint(1));
set(handles.edit21,'String',tempPoint(2));
set(handles.edit22,'String',tempPoint(3));

tempPointTemps = evalin('base','tempPointTemps');
tempPointTemp = tempPointTemps{indexSelected};
set(handles.edit23,'String',tempPointTemp);

tempPointNIIfiles = evalin('base','tempPointNIIfiles');
tempPointNII = tempPointNIIfiles{indexSelected};
set(handles.edit25,'String',tempPointNII);


% --- Executes during object creation, after setting all properties.
function listbox3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit21_Callback(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit21 as text
%        str2double(get(hObject,'String')) returns contents of edit21 as a double


% --- Executes during object creation, after setting all properties.
function edit21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit22_Callback(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit22 as text
%        str2double(get(hObject,'String')) returns contents of edit22 as a double


% --- Executes during object creation, after setting all properties.
function edit22_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit22 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit23_Callback(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit23 as text
%        str2double(get(hObject,'String')) returns contents of edit23 as a double


% --- Executes during object creation, after setting all properties.
function edit23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit24_Callback(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit24 as text
%        str2double(get(hObject,'String')) returns contents of edit24 as a double


% --- Executes during object creation, after setting all properties.
function edit24_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit24 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit25_Callback(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit25 as text
%        str2double(get(hObject,'String')) returns contents of edit25 as a double


% --- Executes during object creation, after setting all properties.
function edit25_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton25.
function pushbutton25_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton25 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[niiFile,parentDir] = uigetfile('*.nii','Select Nifty File for Index Gathering');
indexData = initializeNIIfileWithDCMData(parentDir,niiFile); 

%gets slice number that contains the temperature zones
prompt = 'Specify Slice Number:';
title = 'Slice Number Entry:';
sliceNumInput = inputdlg(prompt,title,1);
sliceNum = floor(str2double(sliceNumInput{1}));

%gets the temperature in the temp zone
prompt2 = 'Specify Temperature:';
title2 = 'Temperature Entry:';
temperatureInput = inputdlg(prompt2,title2,1);
curTemperature = floor(str2double(temperatureInput{1}));

%gets the indices of points of temperature zone
wSize = evalin('base','wSize');
indexSlice = indexData(:,:,sliceNum);
[inds, row, col] = getSelectionWindowInds(indexSlice,wSize);
row = floor(row); col = floor(col);

[niiFileVal,parentDirVal] = uigetfile('*.nii','Select Nifty File for Value Gathering');
valueData = initializeNIIfileWithDCMData(parentDirVal,niiFileVal);

valueSlice = valueData(:,:,sliceNum);
diffValsSlice = valueSlice(inds);

nextTempPointN = evalin('base','nextTempPointNum');
if(nextTempPointN < 2)
    tempPointNames = [];
    tempPointNIIfiles = [];
    tempPointCoords = [];
    tempPointTemps = [];
    tempPointDiffVals = [];
    numPoints = 0;
else
    tempPointNames = get(handles.listbox3,'String');
    tempPointNIIfiles = evalin('base','tempPointNIIfiles');
    tempPointCoords = evalin('base','tempPointCoords');
    tempPointTemps = evalin('base','tempPointTemps');
    tempPointDiffVals = evalin('base','tempPointDiffVals');
    numPoints = numel(tempPointNames);
end

fullNIIpath = strcat(parentDirVal,niiFileVal);
tempPointNIIfiles{numPoints+1} = fullNIIpath;
tempPointNames{numPoints+1} = strcat('Temperature_Point_',num2str(nextTempPointN));
tempPointCoords{numPoints+1} = [row col sliceNum];
tempPointTemps{numPoints+1} = curTemperature;
tempPointDiffVals{numPoints+1} = diffValsSlice;

assignin('base','tempPointNIIfiles',tempPointNIIfiles);
assignin('base','nextTempPointNum',nextTempPointN+1);
assignin('base','tempPointCoords',tempPointCoords);
assignin('base','tempPointTemps',tempPointTemps);
assignin('base','tempPointDiffVals',tempPointDiffVals);
set(handles.listbox3,'String',tempPointNames);
set(handles.edit25,'String',fullNIIpath);
set(handles.edit24,'String',row);
set(handles.edit21,'String',col);
set(handles.edit22,'String',sliceNum);
set(handles.edit23,'String',curTemperature);
set(handles.listbox3,'Value',nextTempPointN);




% --- Executes on button press in pushbutton26.
function pushbutton26_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[matFile,parentDir] = uigetfile('*.mat','Select MAT file with Temp Data');
load(strcat(parentDir,matFile));
assignin('base','tempPointCoords',tempPointCoords);
assignin('base','tempPointDiffVals',tempPointDiffVals);
assignin('base','tempPointNIIfiles',tempPointNIIfiles);
assignin('base','tempPointTemps',tempPointTemps);
set(handles.listbox3,'String',tempPointStr);

set(handles.listbox3,'Value',1);

displayCoords = tempPointCoords{1};
set(handles.edit25,'String',tempPointNIIfiles{1});
set(handles.edit24,'String',displayCoords(1));
set(handles.edit21,'String',displayCoords(2));
set(handles.edit22,'String',displayCoords(3));
set(handles.edit23,'String',tempPointTemps{1});

% --- Executes on button press in pushbutton27.
function pushbutton27_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
curContents = get(handles.listbox3,'String');
indexSelected = get(handles.listbox3,'Value');

tempPointCoords = evalin('base','tempPointCoords');
tempPointDiffVals = evalin('base','tempPointDiffVals');
tempPointNIIfiles = evalin('base','tempPointNIIfiles');
tempPointTemps = evalin('base','tempPointTemps');

tempPointCoords(indexSelected)=[];
tempPointDiffVals(indexSelected)=[];
tempPointNIIfiles(indexSelected)=[];
tempPointTemps(indexSelected)=[];
curContents(indexSelected)=[]; %deletes the currently selected one

assignin('base','tempPointCoords',tempPointCoords);
assignin('base','tempPointDiffVals',tempPointDiffVals);
assignin('base','tempPointNIIfiles',tempPointNIIfiles);
assignin('base','tempPointTemps',tempPointTemps);

set(handles.listbox3,'String',curContents);
set(handles.listbox3,'Value',1);

displayCoords = tempPointCoords{1};
set(handles.edit25,'String',tempPointNIIfiles{1});
set(handles.edit24,'String',displayCoords(1));
set(handles.edit21,'String',displayCoords(2));
set(handles.edit22,'String',displayCoords(3));
set(handles.edit23,'String',tempPointTemps{1});



% --- Executes on button press in pushbutton28.
function pushbutton28_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tempPointCoords = evalin('base','tempPointCoords');
tempPointTemps = evalin('base','tempPointTemps');
tempPointDiffVals = evalin('base','tempPointDiffVals');
tempPointNIIfiles = evalin('base','tempPointNIIfiles');

tempPointStr = get(handles.listbox3,'String');

outputFileName = strcat('results/tempPointInfo',makeDateTimeString(),'.mat');

save(outputFileName,'tempPointCoords','tempPointTemps',...
    'tempPointDiffVals','tempPointStr','tempPointNIIfiles');


% --- Executes on button press in pushbutton29.
function pushbutton29_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
tempVals = evalin('base','tempPointTemps');
diffVals = evalin('base','tempPointDiffVals');
[diffPoints,tempPoints] = getTempValsFromCells(diffVals,tempVals);
degree=evalin('base','regressionPolyDegree');
[coeff,xx,yy] = generateRegressionOutput(diffPoints,tempPoints,degree);

figure
plot(xx,yy);
hold on
plot(diffPoints,tempPoints,'rx');
xlabel('Sliding Window RMSE');
ylabel('Temperature Change (Celsius)');
hold off

assignin('base','currentRegressionCoeffs',coeff);
assignin('base','regressionTempPoints',tempPoints);
assignin('base','regressionDiffPoints',diffPoints);
assignin('base','regressionLineXvals',xx);
assignin('base','regressionLineYvals',yy);
outputFileName = strcat('results\regressionInfo',makeDateTimeString(),'.mat');
save(outputFileName,'diffPoints','tempPoints','coeff','xx','yy');

set(handles.edit26,'String',strcat(pwd,'\',outputFileName));

% --- Executes on button press in pushbutton30.
function pushbutton30_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[matFile,parentDir] = uigetfile('*.mat','Select MAT file with Regression Data');
load(strcat(parentDir,matFile));
assignin('base','currentRegressionCoeffs',coeff);
assignin('base','regressionTempPoints',tempPoints);
assignin('base','regressionDiffPoints',diffPoints);
assignin('base','regressionLineXvals',xx);
assignin('base','regressionLineYvals',yy);

set(handles.edit26,'String',strcat(parentDir,matFile));



function edit26_Callback(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit26 as text
%        str2double(get(hObject,'String')) returns contents of edit26 as a double


% --- Executes during object creation, after setting all properties.
function edit26_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton31.
function pushbutton31_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputVol = evalin('base','spatialOffsetROI');
initTemp = evalin('base','initialTemperature');
coeff = evalin('base','currentRegressionCoeffs');
thermMap = polyval(coeff,inputVol)+initTemp; 
assignin('base','currentThermalMap',thermMap);
imtool3D(thermMap);
outputFileName = strcat('results\thermalMap',makeDateTimeString(),'.nii');
saveScanAsNII(thermMap,outputFileName);
set(handles.edit27,'String',strcat(pwd,'\',outputFileName));



% --- Executes on button press in pushbutton32.
function pushbutton32_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imtool3D(evalin('base','currentThermalMap'));


function edit27_Callback(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit27 as text
%        str2double(get(hObject,'String')) returns contents of edit27 as a double


% --- Executes during object creation, after setting all properties.
function edit27_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton33.
function pushbutton33_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton33 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%coeff = evalin('base','currentRegressionCoeffs');
tempPoints = evalin('base','regressionTempPoints');
diffPoints = evalin('base','regressionDiffPoints');
xx = evalin('base','regressionLineXvals');
yy = evalin('base','regressionLineYvals');

figure
plot(xx,yy);
hold on
plot(diffPoints,tempPoints,'rx');
xlabel('Sliding Window RMSE');
ylabel('Temperature Change (Celsius)');
hold off


% --- Executes on button press in pushbutton34.
function pushbutton34_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton34 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[niiFile,parentDir] = uigetfile('*.nii','Select Thermal Map NII file');
thermMap = initializeNIIfile(parentDir,niiFile);
assignin('base','currentThermalMap',thermMap);
set(handles.edit27,'String',strcat(parentDir,niiFile));


% --- Executes on button press in pushbutton35.
function pushbutton35_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton35 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over listbox1.
function listbox1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit6.
function edit6_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit6 and none of its controls.
function edit6_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object deletion, before destroying properties.
function edit9_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton36.
function pushbutton36_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton36 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentROI = evalin('base','currentBaseROI');
contents = cellstr(get(handles.listbox1,'String'));
curROIString = contents{get(handles.listbox1,'Value')};
saveNIIfileForROI(currentROI,curROIString);


% --- Executes on button press in pushbutton37.
function pushbutton37_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton37 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
currentROI = evalin('base','currentComparisonROI');
contents = cellstr(get(handles.listbox1,'String'));
curROIString = contents{get(handles.listbox1,'Value')};
saveNIIfileForROI(currentROI,curROIString);
