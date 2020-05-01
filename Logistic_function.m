clc;
clear all;
close all;
 t=-10:0.1:-2;
 t2=-10:0.1:-1
for i=1:length(t)
    y(i)=1/(1 + 0.01*exp(-t(i)));
  
end

for i=1:length(t2)
    y2(i)=exp((t2(i)+1));
  
end


  
%% Initialize video
myVideo = VideoWriter('Logistic Function'); %open video file
myVideo.FrameRate = 20;  %can adjust this, 5 - 10 works well for me
open(myVideo)
%% Plot in a loop and grab frames
for i=1:1:length(t)
    plot(t(1:i), y(1:i), 'LineWidth', 3)
    title("Expected value ")
    xlabel("Days")
    ylabel("Total Infected")
    
    
    
    pause(0.01) %Pause and grab frame
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    grid on;
    
end
hold on;

close(myVideo)

