% ECE/CS 533 Lecture 5, example 2
% Plot of Frequency response of a low pass filter
% Based on materials from "Multidimensional DSP" by Dedgeon and Mersereau
% (c) copyright 1997-2005 by Yu Hen Hu
% created: 9/12/97
% last update: 9/2005
%          |.125 .25  .125 |
% h(m,n) = |.25  .5   .25  |
%          |.125 .25  .125 |
% H(w,v) = 0.5(1+ cos w)(1 + cos v)
%
w=pi*[-29:29]/30; v=w;
H=0.5*(1+cos(w'))*(1+cos(v));
figure(1)
colormap('hsv');
surf(w/pi,v/pi,H);xlabel('pi');ylabel('pi');