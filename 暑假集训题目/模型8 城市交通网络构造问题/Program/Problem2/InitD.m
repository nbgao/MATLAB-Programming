function D = InitD()
D = zeros(25);
D(:,:) = inf;   % ȫ��Ϊinf
D(logical(eye(25))) = 0;    % �Խ�����0

a = [1	1	2	3	3	4	4	5	6	7	7	8	8	9	10	11	12	13	13	13	13	14	15	16	16	17	17	18	19	21	21	24];
b = [2	6	3	4	8	5	9	10	11	8	14	15	16	10	18	19	13	14	19	20	22	15	22	17	22	18	23	25	20	22	23	25];
d = [128	106	127	109	90	132	112	111	167	92	82	64	91	113	112	119	91	81	137	130	126	72	63	128	95	66	70	67	134	93	112	108];
    
for i = 1:length(a)
    D(a(i),b(i)) = d(i);
    D(b(i),a(i)) = d(i);
end
