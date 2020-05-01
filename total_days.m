clc;
clear all;
close all;

india_total=[1 2 3 5 6 29 30 31 34 39 45 50 71 76 83 95 109 120 141 171 202 241];
india_days=1:length(india_total);
india_rate=zeros(1,length(india_total)-1);
india_total_log=zeros(1,length(india_total));
india_rate_log=zeros(1,length(india_total)-1);


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


%subplot(251)
stem(india_days,india_total)
title("INDIA");
xlabel("Days");
ylabel("Total");
%subplot(252)
h = animatedline;
for k = 1:length(india_days)
    addpoints(h,india_days(k),india_total(k));
    drawnow
end

%{
plot(india_days,india_total)
title("INDIA");
xlabel("Days");
ylabel("Total");
subplot(253)
india_days_rate=india_days(2:length(india_days));
stem(india_days_rate,india_rate)
title("INDIA");
xlabel("Days");
ylabel("RATE");
subplot(254)

india_days_rate=india_days(2:length(india_days));
stem(india_days,india_total_log)
title("INDIA");
xlabel("Days");
ylabel("LOG SCALE TOTAL");



%subplot(255)

india_days_rate=india_days(2:length(india_days));
stem(india_days_rate,india_rate_log)
title("INDIA");
xlabel("Days");
ylabel("LOG SCALE RATE");
%}
