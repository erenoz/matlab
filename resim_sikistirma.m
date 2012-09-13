p=imread('resim.jpg');
[m,n,k]=size(p)
if k>1
    Z(:,:,1)=dct2(p(:,:,1));
    Z(:,:,2)=dct2(p(:,:,2));
    Z(:,:,3)=dct2(p(:,:,3));
    for i=1:m
        for j=1:n
            if((i+j)>100)
                Z(i,j,1)=0;
                Z(i,j,2)=0;
                Z(i,j,3)=0;
            end
        end
    end
    K(:,:,1)=idct2(Z(:,:,1));
    K(:,:,2)=idct2(Z(:,:,2));
    K(:,:,3)=idct2(Z(:,:,3));
    subplot();
%imshow(uint8(Z));
    imshow(uint8(K));
    imwrite(uint8(K), 'renkli.jpg')
else
    dvalue = double(p)/255;
    %dvalue = rgb2gray(dvalue);    
    img_dct=dct2(dvalue);
    img_pow=(img_dct).^2;
    img_pow=img_pow(:);
    [B,index]=sort(img_pow);
    B=flipud(B);
    index=flipud(index);
    compressed_dct=zeros(size(dvalue));
    c = 20000;% bu değer değişebilir
    for k=1:c
        compressed_dct(index(k))=img_dct(index(k));
    end

    im=idct2(compressed_dct);
    imwrite(im, 'renksiz.jpg')
    imshow(im);
end    
