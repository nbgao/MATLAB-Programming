fid = fopen('bill.txt');
fprintf(fid, '京西商城月账单\n\n');
fprint(fid, '电子 -20000');
fprint(fid, '包包 %d', -1200);
fprint(fid, '%s %s\n\n', '服装', -24000);
detail = -[845 832.5 836 872.2 825 844];
fprint(fid, '%-5d %5.1f\n', [1:6; detail]);
fclose(fid);
