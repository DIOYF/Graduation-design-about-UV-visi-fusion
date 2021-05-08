clear
clc
%%%%图像噪声检测
%
%I=imread('图像1/image2.JPG');
%I=rgb2gray(I);
%subplot(221)
%imshow(I)
%title('原图像')
%sel=strel('disk',5);
%I2=imopen(I,sel);
%I2=imclose(I2,sel);
%subplot(222),imshow(I2);
%title('使用结构原始disk(5)先开后闭后的图像');
%[B]=roipoly(I2);
%imhist(I(B));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%分割线，纯粹腐蚀

clc
clear
%%%重构后的直方图
f=imread('图像1/image1.JPG');
%subplot(121),imshow(f);
%title('灰度级重构原图像');
I=imreconstruct(imerode(f,ones(1,10)),f);
%subplot(122),imshow(f_obr);
%title('经开运算重构图');
[B]=roipoly(I);
imhist(I(B));
psnr=psnr(I,f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%备注
%%%  sel=strel('disk',5)构建腐蚀区域,squre为方形
%%%  imerode（I,sel）腐蚀操作
%%%%%subplot(2,211)
%%%%%imshow(I)
%%%%%[B]=roipoly(I);
%%%%%subplot(2,2,2)
%%%%%imhist(I(B));
%%%%%中值滤波
%%%%I=medfilt2(I);
%%%%%%%subplot(2,2,3)
%%%%%%%imshow(I1);
%%%%%%%subplot(2,2,4)
%strel函数的功能是运用各种形状和大小构造结构元素
%这里是创建一个半径为5的平坦型圆盘结构元素



