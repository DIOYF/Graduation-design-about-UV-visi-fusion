clc
clear
%%
%提取图像
f=rgb2gray(imread('图像1/image1.JPG'));
%I=imreconstruct(imerode(f,ones(1,10)),f);
I=im2double(f);
psnr1=0;
%%
for m=1:1:8
    for n=0:0.01:0.4
psf=fspecial('disk',m);
%根据模糊核维纳滤波
wnr1 = deconvwnr(I,psf,n);  %deconvwnr对运动图像去模糊
p=psnr(wnr1,I);
psnr1=max(psnr1,p);
       if p>=psnr1
          parameter1=m;
          parameter2=n;
       end
    end
end
%%
%维纳去模糊，点扩散函数PSF，nsr是加性噪声噪信功率。
wnr1=deconvwnr(I,fspecial('disk',parameter1),parameter2);
figure, 
subplot(211),imshow(I);
title('Original Image ');
subplot(212),imshow(wnr1);
title('processed Image');
%%
%F=fft2(I);
%F=fftshift(F);
%imshow(abs(F));

