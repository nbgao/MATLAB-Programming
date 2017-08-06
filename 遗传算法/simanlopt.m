function [xp,fp] = simanlopt(fun,x0,l,u,tolf,kmax,q)
N = length(x0);
x = x0;
fx = feval(fun,x);
xp = x;
fp = fx;
if nargin < 7
    q = 1;
end
if nargin < 6
    kmax = 200;
end
if nargin < 5
    tolf = 1e-8;
end
for k = 0:kmax
    ti = (k/kmax)^q;
    mu = (ti * 100);
    ddx = mu_inv(2 * rand(size(x))-1,mu) .* (u-1);
    x1 = x + ddx;
    x1 = (x1 < l) .* l + (l <= x1) .* (x1 <= u) .* x1 + (u < x1) .* u;
    fx1 = feval(fun,x1);
    ddf = fx1 - fx;
    if (ddf<0 | rand<exp(-ti*ddf/abs(fx)+eps)/tolf);
        x = x1;
        fx = fx1;
    end
    if fx < fx1
        xp = x;
        fp = fx1;
    end
end

function z = mu_inv(y,mu)
   z = (((1+mu) .^ abs(y)-1)/mu) .* sign(y);
   
    