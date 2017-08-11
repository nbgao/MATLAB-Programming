function S_new = Trans1(S)
pos1 = ceil(rand * 9);
pos2 = ceil(rand * 9);
while (pos1 >= pos2)
    pos1 = ceil(rand * 9);
    pos2 = ceil(rand * 9);
end
S_new = S;
S_new(pos1) = S(pos2);
S_new(pos2) = S(pos1);
