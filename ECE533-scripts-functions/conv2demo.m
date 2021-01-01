% conv2demo.m
% demonstration of 2D convolution using the same example as shown in the
% lecture note system.ppt
% (C) 2006 by Yu Hen Hu
% created: 9/11/2006

clear all; close all
x=[1 0 0
    1 0 0
    1 1 0
    1 1 0
    1 1 1],
h=ones(3),
y=conv2(x,h),