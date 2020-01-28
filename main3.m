A=imread('1.jpg');
C=reshape(A,[],1);
%C=double(C);
D=hist(C,0:255);
B=otsu1(D);
i=1
while i<size(C,1)+1
    if C(i)>B
      C(i)=255;
    else 
      C(i)=0;
    end
    i=i+1
end
E=reshape(C,[size(A,1),size(A,2)]);
imshow(E)