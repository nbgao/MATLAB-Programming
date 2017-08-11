function S = InitPop(popsize,chromlength)
for i = 1:popsize
    S(i,:) = randperm(chromlength);
end
