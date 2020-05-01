clc;
clear all;
close all;
%% Make some data
t = 1:0.1:2*pi
y = sin(t)
%% Initialize video
myVideo = VideoWriter('myVideoFile'); %open video file
myVideo.FrameRate = 10;  %can adjust this, 5 - 10 works well for me
open(myVideo)
%% Plot in a loop and grab frames
for i=1:1:length(t)
    plot(t(1:i), y(1:i), 'LineWidth', 3)

    pause(0.01) %Pause and grab frame
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
end
close(myVideo)