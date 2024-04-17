clc;
clear;
close all;

img = imread('default.jpg');
img_double = im2double(img);
img_scaled = rescale(img_double);

figure
imshow(img_scaled);
