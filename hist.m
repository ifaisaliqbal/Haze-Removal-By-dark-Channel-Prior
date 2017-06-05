clear
clc
I = uigetfile;
I = imread(I);
%I = im2double(I);
if(ndims(I)==3)
    I = rgb2gray(I);
end
bins(1:256)=0;
[rows cols] = size(I);

for r=1:rows
    for c=1:cols
        bins(I(r,c)+1)=bins(I(r,c)+1)+1;
    end
end
stem(bins,'.');
figure;
imhist(I);