clc;
clear;
close all;

img = imread('default.jpg');
img_double = im2double(img);
img_scaled = rescale(img_double);

figure
title("Elysium")
imshow(img_scaled);
