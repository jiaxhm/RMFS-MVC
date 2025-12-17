close all;
clear all;
warning off;

%% Test image1
% f=imread('storagetanks_200.jpg');
% [rows, cols, dim] = size(f);
% cluster_n =4;  
% w =3;  

%% Test image2
f=imread('Sy.png');
[rows, cols, dim] = size(f);
cluster_n =3;  
w =3;  


if dim==3
    f=rgb2gray(f);
end
figure, imshow(f);
%% Riemannian Manifold Space
f = double(f);    
MaxIter = 50;      
MinImpro = 1e-4;   
[Theta,Rho,Psi]=Riemannian_Manifold_Space(f,w);

%% RMFS_MVC
[obj_fcn,idx,w]=RMFS_MVC(cluster_n,Theta,Rho,Psi,MinImpro,MaxIter);
segmented_image = reshape(idx, [rows, cols]);
[fs]=Op_Label_Image(f,idx);
figure,imshow(uint8(fs))
Imshow_3Dspace(idx,cluster_n,Theta,Rho,Psi)
view(35,17)

