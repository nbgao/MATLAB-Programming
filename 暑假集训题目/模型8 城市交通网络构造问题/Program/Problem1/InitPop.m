function S = InitPop(popsize,chromlength)
years = 10;
num1 = [1 2 6 7];
num2 = [1 6];

for i = 1:popsize
    flag = [4 2 1 1 1 4 2 1 1 1];
    while(1)
        for j = 1:chromlength
            if(j==3 || j==15)
                year = num1(ceil(rand()*4));
                S(i,j) = year;
            elseif(j == 16)
                year = num2(ceil(rand()*2));
                S(i,j) = year;
            else
                while(1)
                    year = ceil(rand()*years);
                    S(i,j) = year;
                    if(flag(year) > 0)
                        flag(year) = flag(year)-1;
                        break;
                    end
                end
            end
        end
        if (Valid(S(i,:)) == 1)
            break;
        end
    end
end
