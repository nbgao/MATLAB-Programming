tic
roads = 17;
years2 = 10;
while(1)
    for j = 1:roads
        year = ceil(rand()*years2);
        q0(j) = year;
    end
    if (Valid2(q0) == 1)
        break;
    end
end
qq0(cnt_q,:) = q0
cnt_q = cnt_q+1;
toc

[mm0, MM0] = Fitness2(q0)