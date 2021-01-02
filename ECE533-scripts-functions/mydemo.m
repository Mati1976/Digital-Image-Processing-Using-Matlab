% 533demo.m
% demonstrate image processing tasks
% copyright (1997) by Yu Hen Hu
% created: 9/1/97
% modified: 9/21/2005s
% This is a Matlab M-file to demonstrate a partial list
% of image processing tasks. We use 'lena.bmp' as the demonstration
% file 

%
% read image files

clear all; close all; clc
echo on
% This is a demonstration program illustrating various 
% image processing functions in Matlab image processing toolbox
% We assume the file 'lena.bmp' is in the directory

% 1. load window bit mapped image using command "imread"

[x,map]=imread('lena.bmp');

% x is an indexed image where each element points to one row of the 
% colormap "map" which is an m-by-3 matrix of real numbers between 
% 0.0 and 1.0. Each row is an RGB vector that defines one color. 
% The kth row of the colormap defines the kth color, 
% where map(k,:) = [r(k) g(k) b(k)]) specifies the intensity of 
% red, green, and blue. 
whos
% We can see there are 256 possible entries in the color map, and 
% the image is 512 pixels by 512 pixels
% 
% press any key to continue ...
pause; clc;

% 2. we display this gray-scaled image
% 
figure(1),set(1,'position',[1 180 400 380])  % open a figure window
imshow(x,map);      % display image
axis image;    % add axis to the image
% 
% press any key to continue ...
pause; clc;

% 3. In order to process the image, we convert it to gray scale image
% 
I=ind2gray(x,map);  % the range of each pixel of I is between 0 and 1
clear x; clear map  % save some memory space, option if you have lots of RAM
figure(2),set(2,'position',[400 180 400 380])  % open a 2nd figure window
colormap('gray');  % set color map to 64 level gray scale image
imshow(I);
% 
% press any key to continue ...
pause; clc;


% 4. We can rotate the image 
%
b=rot90(I);
figure(2),colormap('gray'),imagesc(b);
% 
% press any key to continue ...
pause; clc;


% 5. We can slice the gray levels into 10 bins and assign pseudo 
%    color to each bin -- Nice poster, isn't it?

b= grayslice(I);
figure(2),colormap('prism'),imagesc(b);
% 
% press any key to continue ...
pause; clc;

% 6. We can also enhance the contrast of an image using 
%    "Histogram Equalization" ....

b=histeq(I);
figure(2),colormap('gray'),imshow(b);
% 
% press any key to continue ...
pause; clc;

% 7. Image may become noisy ...
%   This is salt and pepper noise which may occur at noisy
%   image transmission with impulsive noise
 
b=imnoise(I,'salt & pepper',0.05);
figure(2),imshow(b)

% 
% press any key to continue ...
pause; clc;

% 8. If we use a low pass filter
%    1  1  1  1  1
%    1  1  1  1  1 
%    1  1  1  1  1  
%    1  1  1  1  1 
%    1  1  1  1  1
%    to filter the noisy image, we remove the noise, but
%    also cause edge to be blurred.

hmask=[1 1 1 1 1;1 1 1 1 1; 1 1 1 1 1;1 1 1 1 1;1 1 1 1 1]*.04;
c=filter2(hmask,b);
figure(2),imagesc(c)
% 
% press any key to continue ...
pause; clc;


% 9. A medium filter can remove impulsive noise without blurring
%    edges

c=medfilt2(b);
figure(1),imagesc(c)
clear c, clear b,clear hmask
pause

% 10.  Block based processing is used in image compression
%    Here we perform 2D DCT on each 8 by 8 block of the Lena Image.
%    We can see that except a large DC component, the rest high 
%    frequency components are rather small and hence can be 
%    eliminated without seriously affect the quality of the image
%    This is the basis of transformed image coding

b = blkproc(I,[8 8],'dct2');

% First, we examine an area containing high spatial frequency features:

tmp=b(321:328,129:136); tmax=max(max(tmp));tmin=min(min(tmp));tmp=(tmp-tmin)*255/(tmax-tmin);
floor(tmp)
% 
% press any key to continue ...
pause; clc;

% Next, we examine an area containing low spatial frequency features:

tmp=b(1:8,1:8); tmax=max(max(tmp));tmin=min(min(tmp));tmp=(tmp-tmin)*255/(tmax-tmin);
floor(tmp)

% 
% press any key to continue ...
pause; clc;


% We may quantize these dct coefficient.  Eg. for [1:8, 1:8] block,

tmp=fix(tmp)

b=fix(b);   % Now apply quantization to entire DCT coefficients
b=blkproc(b,[8 8],'idct');
figure(2),imagesc(b)

% Obviously, the result is quite dissapointing.  But this illustrate
% the needs for a sophisticated scheme for quantization.  
% 
% press any key to continue ...
pause; clc;

% 11.  Next, we try image edge detection so that we can identify the
% boundary of object in an image.  For this, we apply a spatial
% mask
%      -1  -2  -1
%      -2  12  -2
%      -1  -2  -1

hmask=[-1 -2 -1; -2 12 -2; -1 -2 -1]/24;
b=filter2(hmask,I);
figure(2),imagesc(b)

%  This is the end of image processing demo program. Hope you
%  will like image processing