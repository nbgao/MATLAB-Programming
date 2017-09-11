[a,b,c,d,e,f] = deal(1,2,3,4,5,6);

w = [0 2 3 0 0 0
     2 0 6 5 3 0
     3 6 0 0 1 0
     0 3 1 1 0 4
     0 0 0 2 4 0];

W = sparse(w);
[dist, path, pred] = graphshortestpath(W,a,f)