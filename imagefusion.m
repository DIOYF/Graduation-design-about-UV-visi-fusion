function [fusion,w1] = imagefusion(ultra,visi)
%%
%基于像素级，实现紫外图像与可见图像的图像融合，将图像在r，g，b三个通道进行显示的
%%
w1=max(max(visi))/max(max(ultra));
w1=min(w1,3);
fusion=cat(3,ultra.*w1+visi,visi,ultra.*w1+visi);
fusion=(fusion-min(min(min(fusion))))./( max(max(max(fusion)))-min(min(min(fusion))) );
end

