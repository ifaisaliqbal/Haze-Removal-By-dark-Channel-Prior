function [I_new,J] = change_contrast(I,I_new,J,reg_list,r,c,contrast,boundary_mean)
if(contrast< 0.33)
        new_cont = 0.757*contrast;
elseif(contrast>= 0.33 && contrast<0.66)
         new_cont = (1.515*contrast)-0.25;
else
        new_cont = 0.757*contrast+0.243;
end
new_val = new_cont*boundary_mean+boundary_mean;
for n=1:size(reg_list)
    if(I(reg_list(n,1),reg_list(n,2))==I(r,c))
        I_new(reg_list(n,1),reg_list(n,2)) = new_val;
        J(reg_list(n,1),reg_list(n,2))=1;
    end
end
