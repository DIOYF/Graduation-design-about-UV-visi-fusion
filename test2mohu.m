%%算子法的去模糊
%%处理过程
%%算子法去模糊
%bw1 = edge(visi,'canny');
%visi=visi*0.9+25.5*unit8(bw1);
%bw2 = edge(ultra,'roberts');
%ultra=ultra*0.9+25.5*unit8(bw2);
%%
clear
clc
I=imread('图像1/image1.JPG');
I=rgb2gray(I);
I=imreconstruct(imerode(I,ones(1,10)),I);
%%
%%I=imread('图像1/image1.JPG');
%%I=rgb2gray(I);
%%I=imreconstruct(imerode(I,ones(1,10)),I);
%%bw1 = edge(I,'sobel');
%%bw2 = edge(I,'roberts');
%%bw3 = edge(I,'log');
%%bw4 = edge(I,'canny');
%%figure
%%subplot(2,2,1); imshow(bw1);title('sobel算子');
%%subplot(2,2,2);imshow(bw2);title('roberts算子');
%%subplot(2,2,3);imshow(bw3);title('log算子');
%%subplot(2,2,4);imshow(bw4);title('canny算子')
%%bw4=255*uint8(bw2);
%%figure
%%空域锐化
%%out1=I*0.9+bw4*0.1;
%%out2=I-bw4;
%%out3=(I+bw4)./2;
%%subplot(121)
%%imshow(I);
%%title('原图像')
%%subplot(122)
%%imshow(out1);
%%title('增强后的图像')
%%
clc
clear
%%%图像滤波方式，忽略，不用到最终程序
f=imread('图像1/image2.JPG');
I=imreconstruct(imerode(f,ones(1,10)),f);
I=im2double(rgb2gray(I));
F=fft2(I);
F=fftshift(F);
[M,N]=size(F);
[u,v]=meshgrid(1:M,1:N);
H=exp(-0.0025*((u-M/2).^2+(v-N/2).^2).^(5/6));
F=F.*H';
X=ifftshift(F);
x=ifft2(X);
x=uint8(abs(x)*256);
subplot(131);
imshow(I);
title('原图像')
subplot(132);
imshow(x);
title('低通图像')
I=uint8(abs(I)*256)-0.1*x;
subplot(133)
imshow(I);
title('处理后的图像')
%%

%%基于小波的内插法
clear
clc
I=imread('图像1/image2.JPG');
I=rgb2gray(I);
I=imreconstruct(imerode(I,ones(1,10)),I);
subplot(311)
imshow(I);title('原图像')
%%
[Y1,map]=imresize(I,2,'bilinear');%双线性差值法
[c,s]=wavedec2(Y1,2,'haar');
sizey1=size(Y1);
Xa1=appcoef2(c,s,'haar',1);
Xh1=detcoef2('h',c,s,1);
Xv1=detcoef2('v',c,s,1);
Xd1=detcoef2('d',c,s,1);
ded1=[Xa1,Xh1,Xv1,Xd1];
nbcol=size(map,1);
Y=idwt2(Xa1,Xh1,Xv1,Xd1,'haar');
subplot(312)
imshow(uint8(Y)),title('双线性插值法获得的超分辨率图像')
%%
[Y2,map]=imresize(I,2);%最近邻域插值法
[c,s]=wavedec2(Y2,2,'haar');
Xa2=appcoef2(c,s,'haar',1);
Xh2=detcoef2('h',c,s,1);
Xv2=detcoef2('v',c,s,1);
Xd2 =detcoef2('d',c,s,1);
ded1=[Xa2,Xh2,Xv2,Xd2];
nbcol=size(map,1);
Y=idwt2(Xa2,Xh2,Xv2,Xd2,'haar');
subplot(313)
imshow(uint8(Y)),title('最近邻域插值法获得的超分辨率图像');



