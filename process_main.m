clear all;
clc
%选择纯图像集所在文件夹名称
filename='图像3';
%
listing=dir(filename);
l=length(listing);
aviobj=VideoWriter('图像视频流图像3.avi');
avobj.FrameRate=5;%图像帧率，由于图像集较小，选择较低帧率
open(aviobj)
for i=3:2:l-1
    [ultra,visi]=loadimage1(i,filename);
    output=imagefusion(ultra,visi);
    writeVideo(aviobj,output);
end
close(aviobj)
disp(filename);
disp('视频流已生成，视频保存在当前文件夹下.avi');
