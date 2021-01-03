function Res = EqPic(OldPic,NewPic)
%The function equalizes the histogram of the picture and plots the
%equalized histogram and equalized picture 
clc

[OrigPicHist,OrigPic]=HistM(OldPic);
L=size(OrigPicHist);
[m,n]=size(OrigPic);
NewPicCDF=zeros(1,L(2));
NewPicHIst=zeros(1,L(2));
Res=zeros(m,n);

for i=1:L(2)
    for j=1:i
        NewPicCDF(i)=NewPicCDF(i)+OrigPicHist(j);
    end 
end

NewPicTr=round(NewPicCDF.*(L(2)-1));

for i=1:m
    for j=1:n
        Res(i,j)=NewPicTr(OrigPic(i,j)+1);
    end 
end
Res=uint8(Res);

imwrite(Res,NewPic);


end

