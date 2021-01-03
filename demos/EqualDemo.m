% A demo of an eqalization of a pic

clc;
clear all;
[OldHist,Data]=HistM('cameraman.tif');
NewPicData=EqPic('cameraman.tif','cameraman_N.tif');
[NewHist,NewData]=HistM('cameraman_N.tif');
figure (1);
subplot(2,2,3); stem(OldHist);title('Old Pic: histogram');grid on;
subplot(2,2,4); stem(NewHist);title('New Pic: histogram');grid on;
subplot(2,2,1); imshow(Data);title('Old Pic');
subplot(2,2,2); imshow(NewPicData);title('New Pic');

