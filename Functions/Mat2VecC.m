function Res = Mat2VecC(Mtx)
% This function takes the matrix data and trnes it into a long Column
% vector
% Input : matrix m*n
% Output : Column vector (m*n,1)
[m,n]=size(Mtx);
for i = 1:m
    for j= 1:n
        Res((i-1)*m+j,1)=Mtx(i,j);
    end
end
end

