clc;
clear;
theta = 0;
I = imread('lake.tif');
I = I(:,:,1);
b = edge(I,'canny');
CC = bwconncomp(b);
[rows_cons cols_cons] = size(I);
bl = zeros(rows_cons,cols_cons);
numPixels = cellfun(@numel,CC.PixelIdxList);
figure,imshow(I);
my(2)=0;
hold on;

for a=1:CC.NumObjects
    if(numPixels(a)>50)
        ff=1;
        count=1;
        l=CC.PixelIdxList{a};
        [row col]=ind2sub(size(I),l);
        rho =[];
        rho = col.*cosd(theta)+row.*sind(theta);
        M = mode(rho);
        if(sum(rho==M)>50)
            while (ff<3&&count<max(size(rho)))
                if(rho(count)==M)
                   my(ff)=count;
                   ff=ff+1;
                end
                count=count+1;
            end
            x_lim=512; 
            y_lim=512;
            x=[col(my(1)); col(my(2))];
            y=[row(my(1))-10; row(my(2))];
            scatter(x,y,'ro');hold on;
            lineObj=fit(x,y,'poly1'); 
            new_lim_x=1:0.1:512; 
            new_lim_y=feval(lineObj,new_lim_x);
            plot(new_lim_x,new_lim_y);
            M
            sum(rho==M)
        end
    end
end
