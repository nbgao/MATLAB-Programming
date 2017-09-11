function gaps = gaplength(x, L, ncar)
gaps = zeros(1,ncar)
gaps = x([2:end 1]) - x;    % d(i) = x(i+1) - x(i)
gaps(gaps<=0) = gaps(gaps<=0) + L;    % d(i) = d(i) + L, if d(i)<0