Initial Requirements:

NiftyReg:
In order to perform registration, NiftyReg must be installed. 
Following folder must be part of "PATH" environment variable:
	<NiftyReg Install Folder>\bin
	
Matlab:
Matlab 2013b or above is recommended
Statistics Toolbox and Image Processing Toolbox are required
To generate Spatial Offset RMSE map, Matlab must be running Java 7 or above


Install Instructions:

1. Unzip folder
2. Change the Matlab directory to location of unzipped folder 
3. Open ctThermConfig.m and set desired configuration values
4. Type "run" in command window to start the program



User Instructions (Registration Step):

1. Click "Load Baseline Scan (DICOM Folder) and Save As NII" 
2. Select the DICOM folder with the CBCT series
3. The NII file containing the whole scan is saved as:
   "results/<Patient Last Name>_<Study Date>_<Series Number>.nii"
4. Wait until the field "Baseline Scan File:" shows that file

5. Click on "Load Comparison Scan (DICOM Folder) and Save As NII" 
6. Repeat steps 2-3
7. Wait until the field "Comparison Scan File:" shows the correct NII file

8. Click on "Make Registration Batch Script" to generate the .bat file that will do the registration
9. The field "Batch Script File:" will show where the generated batch file is saved
10. Click on "Run Batch Script" or run the .bat file from the Windows Command Prompt
	- NOTE: The batch script takes 1-5 hours at the moment, 
	
11. Wait for the registration to finish
12. Click on "Load Comparison Scan - NII file"
13. Select the file "<Comparison Scan>_registered.nii"
14. The baseline and registered comparison CBCT scan are now ready for analysis


User Instructions (ROI step):

NOTE: Make sure both baseline and comparison scans are loaded before proceeding
1. Click on "Make ROIs automatically - Run Needle Detection"
2. A 3D Plot will appear showing the detected components and endpoints
3. Close the 3D Plot if satisfied with the detections
4. The "ROI List: " will be now be populated with the detected endpoints
5. The fields under "Current ROI: " show the parameters of the ROI. 
	They can be changed if desired.
6. If you need a new ROI, click "Make ROI Manually" 
	and adjust the parameters in the fields under "Current ROI:"

If you click on "View ROI in Baseline Scan" or "View ROI in Comparison Scan":
	- The ROI selected in the "ROI List:" is the one that will appear	
	
If you click on "Save ROI in Baseline Scan" or "Save ROI in Comparison Scan":
	- The ROI selected in the "ROI List:" is the one saved
	- It is saved in the "results" folder under the file name 
		"ROIselectedOn_<Date/Time when button clicked>.nii"

		


















