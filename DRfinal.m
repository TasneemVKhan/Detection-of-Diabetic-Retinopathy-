clc
clear

%%% Abnormal eye
% s = strel('disk',12);

a = imread('im0148.jpg');
figure,imshow(a);

b = rgb2gray(a);
figure(2),imshow(b);

c = adapthisteq(b);
figure(3),imshow(c);

d = imcomplement(c);
figure(4),imshow(d);

e = imadjust(d, stretchlim(d),[]); 
figure(5),imshow(e);

%%%%Normal eye

A1 = imread('im0018.jpg');
figure(6),imshow(A1);

B1 = rgb2gray(A1);
figure(7),imshow(B1);

C1 = adapthisteq(B1);
figure(8),imshow(C1);

D1 = imcomplement(C1);
figure(9),imshow(D1);

E1 = imadjust(D1, stretchlim(D1),[]); 
figure(10),imshow(E1);

%%%%%%%% Subtract
sub = (E1-e);
figure(11),imshow(sub);

p = imadjust(sub, stretchlim(sub),[]); 
figure(12),imshow(p);

q = fspecial('gaussian');
r = imfilter(p,q);
figure(13),imshow(r);

s = fspecial('laplacian');
t = imfilter(r,s);
figure(14),imshow(t);

u = edge(t,'sobel');
figure(15),imshow(u);

hy = fspecial('sobel');
hx=hy';
Iy=imfilter(double(u), hy, 'symmetric');
Ix=imfilter(double(u), hx, 'symmetric');
gradmag=sqrt(Ix.^2 + Iy.^2);
figure(16),imshow(gradmag);

L=watershed(gradmag);
Lrgb=label2rgb(L);
figure(17),imshow(Lrgb);