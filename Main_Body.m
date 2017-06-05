clear
clc
I = uigetfile;
I = imread(I);
I = im2double(I);
if(ndims(I)==3)
    I = rgb2gray(I);
end
I_new = I;
[rows cols] = size(I);
 J = zeros(rows,cols);
for r = 1:rows
    r
    for c = 1:cols
        if(J(r,c)~=1)
            [J2,reg_mean,reg_list] = Region_Growing(I,r,c);     %Region growing is done for each seed pixel
            [boundary_mean1] = MBGV(I,J2);                      %Mean Background value is calculated on horizontal neighbours
            [boundary_mean2] = MBGV(I.',J2.');                  %Mean Background value is calculated on vertical neighbours
            boundary_mean=(boundary_mean1+boundary_mean2)/2;    %Mean of these two values is taken
            contrast = ((reg_mean-boundary_mean)/boundary_mean); % Percentage Contrast is calculated
            if(abs(contrast)<0.05)                                      %If contrast is less than 5% then transformation is done
                [I_new,J] = change_contrast(I,I_new,J,reg_list,r,c,contrast,boundary_mean);
            end
        end
   end
end
imshow(I_new);