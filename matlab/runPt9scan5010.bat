reg_aladin -ref D:/git/NIHProject/matlab/niftiFilesPt9_5010/fixed_5010.nii -flo D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011.nii  -aff  D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011_transform.txt
reg_f3d -ref D:/git/NIHProject/matlab/niftiFilesPt9_5010/fixed_5010.nii -flo D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011.nii -aff D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011_transform.txt -cpp D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011_cpp.nii -res D:/git/NIHProject/matlab/niftiFilesPt9_5010/moving_5011_registered.nii