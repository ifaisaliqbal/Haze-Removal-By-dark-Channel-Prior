files = dir('C:\Users\Faisal Iqbal\Desktop\Cup Images\');
for m = 1:numel(files)
  if strcmp(files(m).name(end-3:end),'.jpg')
    x = imread(file(m).name,'jpg');
    imshow(x);
    k = waitforbuttonpress;
  end
end