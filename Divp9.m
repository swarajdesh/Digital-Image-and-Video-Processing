%Program For Frame Extraction of video

clc;
close all;
clear all;
%reading a video file
mov = VideoReader('C:\Users\SuRaj\Desktop\sky\oty.avi');
% Defining Output folder name
opFolder = fullfile(cd, 'suraj');
%if not existing
if ~exist(opFolder, 'dir')
%make directory & execute as indicated in opfolder variable
mkdir(opFolder);
end
%getting no of frames
numFrames = mov.NumberOfFrames;
%setting current status of number of frames written to zero
numFramesWritten = 0;
%for loop to traverse & process from frame '1' to 'last' frames
for t = 1 : numFrames
currFrame = read(mov, t); %reading individual frames
I = .2989*currFrame(:,:,1)+.5870*currFrame(:,:,2) +.1140*currFrame(:,:,3);
opBaseFileName = sprintf('%3.3d.png', t);
opFullFileName = fullfile(opFolder, opBaseFileName);
imwrite(currFrame, opFullFileName, 'png'); %saving as 'png' file
%S=imdiff(currFrame-(currFrame-1));
%indicating the current progress of the file/frame written
disp(t);
progIndication = sprintf('Wrote frame %4d of %d.', t, numFrames);
disp(progIndication);
numFramesWritten = numFramesWritten + 1;
end %end of 'for' loop
progIndication = sprintf('Wrote %d frames to folder "%s"',numFramesWritten, opFolder);
disp(progIndication);