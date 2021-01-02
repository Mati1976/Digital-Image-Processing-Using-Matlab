function res=PaddedPic(pic,type,X);

[m,n]=size(pic)
switch type 
    case 0
        T=zeros(m,X);
        res=[T pic T];
        T=zeros(X,m+2*X);
        res=[T;res; T]
    case 1
        T=ones(m,X);
        res=[T pic T];
        T=ones(X,m+2*X);
        res=[T;res; T];
    case 2
        T=pic((X+1):-1:2,:);
        res=[T;pic];
        T=pic((n-1):-1:(n-X),:);
        res=[res;T];
        T=res(:,(X+1):-1:2);
        res=[T res];
        T=res(:,(n+X-1):-1:(n));
        res=[res T];
        
        
        
        
        
end
end
