function S_new = Trans(S)
pos1 = ceil(rand * 50);
pos2 = ceil(rand * 50);
while (pos1 >= pos2)
    pos1 = ceil(rand * 50);
    pos2 = ceil(rand * 50);
end
S_new = S;
S_new(pos1:pos2) = S(pos2:-1:pos1);