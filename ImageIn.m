clear
clc

%Input the image
imName=input('Enter the name of the image: ','s');
image=imread(imName);

%input the message
mes=input('Enter the message: ','s');

tic

%convert the message to binary
binMes=dec2bin(mes);

%know the number of charcters (to stop the 
%steganography after hidding the
%message)
[a,b]=size(binMes);

%reshape the binary message to an array
binMes=reshape(binMes,1,b*a);

%convert the size of message to binary as a key
binLen=50;
enle=dec2bin(a,binLen);

%know the size of the original image to 
%reshape it when retreived
[h,w,d]=size(image);

%convert the image into binary
binImage=dec2bin(image);

%know the size of the binary image
[r ,c]=size(binImage);

%encrypting the length of the message
for i=1:binLen
    binImage(i,8)=enle(1,i);
end

%encrypting the message
for i=binLen+1:(b*a+binLen)
    binImage(i,8)=binMes(1,i-binLen);
end

%Fixing the image to its original state
encImage=bin2dec(binImage);
encImage=reshape(encImage,h,w,d);
encImage=uint8(encImage);
encImgName = "(encrypted) " + imName;
imwrite(encImage, encImgName);

toc