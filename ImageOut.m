clear

%decrypting the message
%input the image
encImgName = input('Enter encrypted image name: ', 's');

tic

im=imread(encImgName);
enim=im;

%turn the image to binary
enim=dec2bin(enim);

%reading the length of the message
binLen=50;
for i=1:binLen
    bleofmes(1,i)=enim(i,8);
end

%turn the length of the message to decimal
leofmes=bin2dec(bleofmes);

%reading the message
for i=binLen+1:(binLen+leofmes*7)
    dbmes(i-binLen)=enim(i,8);
end

dbmes=reshape(dbmes,leofmes,7);
finmes=char(bin2dec(dbmes));
finmes=reshape(finmes,1,leofmes);
fprintf("Messege is: ");
disp(finmes);

toc
