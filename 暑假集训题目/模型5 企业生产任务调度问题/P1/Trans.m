function S_new = Trans(S)
pos1 = ceil(rand * 9);
pos2 = ceil(rand * 9);
while (pos1 >= pos2)
    pos1 = ceil(rand * 9);
    pos2 = ceil(rand * 9);
end
S_new = S;
S_new(pos1:pos2) = S(pos2:-1:pos1);
