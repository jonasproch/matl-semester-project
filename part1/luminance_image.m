clc;
clear;
close all;

img = imread('default.jpg');
img_double = im2double(img);
img_scaled = rescale(img_double);

m = size(img_scaled, 1);
n = size(img_scaled, 2);

red_channel = img_scaled(:,:,1);
green_channel = img_scaled(:,:,2);
blue_channel = img_scaled(:,:,3);

red_h = mean(red_channel, 1);
green_h = mean(green_channel, 1);
blue_h = mean(blue_channel, 1);

red_v = mean(red_channel, 2);
green_v = mean(green_channel, 2);
blue_v = mean(blue_channel, 2);

figure('Position', [200, 100, 900, 600])

subplot(3, 4, [1, 5]);
hold on
plot(red_v, 1:length(red_v), 'r')
plot(green_v, 1:length(green_v), 'g')
plot(blue_v, 1:length(blue_v), 'b')
xlabel('Image dimension')
ylabel('Color frequency')
xlim([0, 0.5])
ylim([0, m])

subplot(3, 4, [10, 11, 12]);
hold on
plot(red_h, 'r')
plot(green_h, 'g')
plot(blue_h, 'b')
xlabel('Color frequency')
ylabel('Image dimension')
xlim([0, n])
ylim([0, 0.6])

subplot(3, 4, [2, 3, 4, 6, 7, 8]);
imshow(img_scaled);
