function Mtx = Vec2Mat(Vec,M,N)
% This function takes the a row vector data and turnes it into M*N matrix
% Input :  vector (m*n,1) or (1,m*n)
% Output: matrix M*N (does not need to be the original size
[m,n]=size(Vec);
for i = 1:M
    for j= 1:N
        Mtx(i,j)=Vec((i-1)*M+j);
    end
end
end

