clc;
clear all;
close all;

%ITALY
italy_total=[3 3 3 3 3 4 19 75 152 221 310 455 593 822 1049 1577 1835 2263 2706 3296 3916 5061 6387 7985 8514 10590 12839 14955 20603 23073 26062 28710 35190 41035 47021 53578 59138];
italy_days=1:length(italy_total);
italy_rate=zeros(1,length(italy_total)-1);
italy_total_log=zeros(1,length(italy_total));
italy_rate_log=zeros(1,length(italy_total)-1);
italy_days_rate=italy_days(2:length(italy_days));


%rate mapping 
for i=1:length(italy_total)-1
    
   italy_rate(i)=italy_total(i+1)/italy_total(i); 
end


%rate mapping 
for i=1:length(italy_total)-1
    
   italy_rate_log(i)=log(italy_total(i+1)/italy_total(i)); 
end

%logarithmic graph
for i=1:length(italy_total)
   italy_total_log(i)=log(italy_total(i)); 
end









%INDIA
india_total=[1 2 3 5 6 29 30 31 34 39 45 50 71 76 83 95 109 120 141 171 202 252 328 393];
india_days=1:length(india_total);
india_rate=zeros(1,length(india_total)-1);
india_total_log=zeros(1,length(india_total));
india_rate_log=zeros(1,length(india_total)-1);
india_days_rate=italy_days(2:length(india_days));




%rate mapping 
for i=1:length(india_total)-1
   india_rate(i)=india_total(i+1)/india_total(i); 
end

% log rate mapping 
for i=1:length(india_total)-1
   india_rate_log(i)=log(india_total(i+1)/india_total(i)); %base 'e' 
end

%logarithmic graph
for i=1:length(india_total)
   india_total_log(i)=log(india_total(i)); 
end

title("INDIA");
xlabel("Days");
ylabel("Total");

myVideo = VideoWriter('myVideoFile_rate'); %open video file
myVideo.FrameRate = 6;  %can adjust this, 5 - 10 works well for me
open(myVideo)

for i=1:1:length(india_days_rate)
    subplot(121)
    plot(india_days_rate(1:i), india_rate(1:i),'-y', 'LineWidth', 3)
        text(india_days_rate(i),india_rate(i),['(' num2str(india_days_rate(i)) ',' num2str(india_rate(i)) ')'])

    title("INDIA");
xlabel("Days");
ylabel("Total Infected");
    pause(0.01) %Pause and grab frame
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    
 
end

%COORDINATE LABELING CODE
for i=1:8:length(india_days_rate)
    text(india_days_rate(i),india_rate(i),['(' num2str(india_days_rate(i)) ',' num2str(india_rate(i)) ')'])
end

grid on;

for i=1:1:length(italy_days_rate)
    subplot(122)
    plot(italy_days_rate(1:i), italy_rate(1:i), '-y','LineWidth', 3)
        text(italy_days_rate(i),italy_rate(i),['(' num2str(italy_days_rate(i)) ',' num2str(italy_rate(i)) ')'])
    title("ITALY");
xlabel("Days");
ylabel("N_{d+1}/N_d(RATE OF GROWTH)");
    pause(0.01) %Pause and grab frame
    frame = getframe(gcf); %get frame
    writeVideo(myVideo, frame);
    
 
end

%COORDINATE LABELING CODE
for i=1:8:length(italy_days_rate)
    text(italy_days_rate(i),italy_rate(i),['(' num2str(italy_days_rate(i)) ',' num2str(italy_rate(i)) ')'])
end
grid on;

close(myVideo)
grid on;
%stem(india_days,india_total)
