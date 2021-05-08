clear
clc
%测试预处理与融合所得最终效果
[ultra,visi]=loadimage1(31,'图像1');
[fusion,w1] = imagefusion(ultra,visi);
subplot(131)
imshow(ultra);
subplot(132)
imshow(visi);
subplot(133)
imshow(fusion);