
function thresholded=SS_image_threshold_quick_sliding_Otsu(grayImage,m,n)


A = im2double(grayImage);
[mm,nn]=size(A);
newA=zeros(mm,nn);
k=double(fix(m/2));
p=double(fix(n/2));
% k2=int8(fix(m/2));
% p2=int8(fix(n/2));
[padding,F]=mode(A(:));
A2=padarray(A,[k p],padding,'both');%padding 
[mm2,nn2]=size(A2);
newA2=zeros(mm2,nn2);
for ii=k+1:mm+k
    for jj=p+1:nn+p
        tempmat=A2(ii-k:ii+k-1,jj-p:jj+p-1);
        calvec=reshape(tempmat,[m*n 1]);
        level=graythresh(calvec);
        newA2(ii,jj)=~(A2(ii,jj)>level); % dark object with bright BG, threshold one pixel at each step
    end
end
newA=newA2(k+1:mm+k,p+1:nn+p);

newA=logical(newA);

sobelImage = imgradient(grayImage, 'Sobel');
sdImage = stdfilt(sobelImage, ones(9));
% Do a global Otsu of the stddev image.

binaryImage = sdImage > 25; % adjustable, based on SNR

thresholded = (newA&binaryImage);
% thresholded = newA;
