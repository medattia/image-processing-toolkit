function main()
Files=dir('/home/mohamed/Desktop/Imagerie et Applications Professionnelles/Base/*.*')

for k=1:length(Files)
    FileNames=Files(k).name
    a=imread(FileNames);
    b=rgb2gray(a);
    c=hist(b,256);
    somme=sum(c(2,:));
    d(k,:)=double(c(:,1))/double(somme)
end
    aa=imread("1.5.jpg");
    bb=rgb2gray(aa);
    figure,imshow(bb);

  %d=RGBTONTSC(a);
%imshow(d);
%subplot(3,3,1);
%imshow(b);
%subplot(3,3,2);
%imshow(c);
%subplot(3,3,3);
%imshow(d);
%subplot(3,3,4);
%imshow(e);
%subplot(3,3,5);
end
