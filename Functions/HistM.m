function [Res,Data] = HistM(Pic)
%A function that calculates the Histogram of a function for each of the
% intensity levels
% Input : Picture file

clc
close all;
PicInfo=imfinfo(Pic);
L=PicInfo.BitsPerSample;

Levels=2^L;
Res=zeros(1,Levels);
Data=imread(Pic);
[m,n]=size(Data);


for i=1:m
    for j=1:n
        t=Data(i,j);
        Res(t+1)=Res(t+1)+1;
    end
end

Res=Res/(m*n);

end

