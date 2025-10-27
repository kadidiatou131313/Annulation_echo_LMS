function [Wst, y, e] = algolms2(x, d, P, mu)

N = length(x);
Wst = zeros(P, N);
y = zeros(N, 1);
e = zeros(N, 1);
w = zeros(P,1); 
for n = 1:N
   xn = zeros(P,1);
   kmax = min(P,n);
   xn(1:kmax) = x(n:-1:n-kmax+1);
   y(n) = w' * xn;            
   e(n) = d(n) - y(n);        
   w = w + mu * e(n) * xn;    
   Wst(:,n) = w;                
end
end







