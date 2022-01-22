close all; clear; clc;
trl1='C:\Users\acer\Desktop\AGH\7semestr\inz\worldview\tiff\train_labels\train_labels (';
trl2=').tif';
tr1='C:\Users\acer\Desktop\AGH\7semestr\inz\worldview\png\train\train(';
tr2=').png';
zapis1='C:\Users\acer\Desktop\AGH\7semestr\inz\worldview\train_pos\train_pos';
zapis2='.png';
zapis3='C:\Users\acer\Desktop\AGH\7semestr\inz\worldview\train_labels_bigger\train_labels_bigger';
zapis4='.tif'
for i=1:137
    strnum=int2str(i);
    str1=strcat(trl1,strnum,trl2)
    str2=strcat(tr1,strnum,tr2)
    a=imread(str1);
    b=imread(str2);
    a=double(a)/255;
    b=double(b)/255;
    [Nz,Nx]=size(a);
    SE=strel('rectangle',[15,15]);
    c=imdilate(a,SE);
    for kx=1:Nx
        for kz=1:Nz
            if c(kz,kx)==1
                b(kz,kx)=1;
            end
        end
    end
    str3=strcat(zapis1,strnum,zapis2);
    str4=strcat(zapis3,strnum,zapis4);
    imwrite(b,str3);
    imwrite(c,str4);
    %imshow(b)
end