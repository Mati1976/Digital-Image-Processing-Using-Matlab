function Res = Mat2VecR(Mtx)
% This function takes the matrix data and trnes it into a long row
% vector
% Input : matrix m*n
% Output :  Row vector (m*n,1)
[m,n]=size(Mtx);
for i = 1:m
    for j= 1:n
        Res(1,(i-1)*m+j)=Mtx(i,j);
    end
end
end

