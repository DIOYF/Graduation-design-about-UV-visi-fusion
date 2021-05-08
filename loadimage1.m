%%%cd 图像1;
%%%进行图像预处理，最终加载的图像保存在ultra与visi,输入参数i为文件所在的位置。
function [ultra,visi]=loadimage1(i,filename1)
if (mod(i,2)==0)
   fprintf('输出参数i出错，应为奇数');
else
cd (filename1)
%%
%%%%%紫外图像保存在ultra，可见图像保存在visi。
listing=dir();
%设置读取图片的位置（可用于比较不同算法的处理效果）
ultra=im2double(rgb2gray(imread(listing(i).name)));
visi=im2double(rgb2gray(imread(listing(i+1).name)));
%%
psnr1=0;
%对紫外图像进行维纳滤波
for m=1:1:5
   for n=0:0.01:0.2
psf=fspecial('disk',m);
%根据模糊核维纳滤波
wnr1 = deconvwnr(ultra,psf,n);  %deconvwnr对运动图像去模糊
p=psnr(wnr1,ultra);
psnr1=max(psnr1,p);
       if p>=psnr1
          parameter1=m;
          parameter2=n;
       end
    end
end
ultra=deconvwnr(ultra,fspecial('disk',parameter1),parameter2);
%%
psnr1=0;
%对可见图像进行维纳滤波
for m=1:1:5
    for n=0:0.01:0.2
psf=fspecial('disk',m);
%根据模糊核维纳滤波
wnr1 = deconvwnr(visi,psf,n);  %deconvwnr对运动图像去模糊
p=psnr(wnr1,visi);
psnr1=max(psnr1,p);
       if p>=psnr1
          parameter1=m;
          parameter2=n;
       end
    end
end
visi=deconvwnr(visi,fspecial('disk',parameter1),parameter2);
%%
cd ..
end
end