clc;
clear;
close all;

img = imread('default.jpg');
img_double = im2double(img);
img_scaled = rescale(img_double);
img_rotated = imrotate(img_scaled, 90);

img_flipped = fliplr(img_rotated);
combined_image = [img_rotated img_flipped];

figure
imshow(combined_image);
