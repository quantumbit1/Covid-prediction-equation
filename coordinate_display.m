clc;
clear all;
close all;
ii=1:5
jj=1:5
[x,y]=meshgrid(ii,jj)
figure
scatter(x(:),y(:),'.')
for k=1:numel(x)
      text(x(k),y(k),['(' num2str(x(k)) ',' num2str(y(k)) ')'])
end