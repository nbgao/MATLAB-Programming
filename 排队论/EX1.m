lambda = 20;
mu = 9;
s = 3;
rho = lambda/(s*mu);
p0 = 1./(sum((s*rho).^k./factorial(k)) + (s*rho)^s/(factorial(s)*(1-rho)) );
Ls = s*rho + (s*rho)^s*rho/(factorial(s)*(1-rho)^2)*p0;
Ws = Ls/lambda;
Wq = Ws - 1/mu