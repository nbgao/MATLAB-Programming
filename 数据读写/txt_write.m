fid = fopen('bill.txt');
fprintf(fid, '�����̳����˵�\n\n');
fprint(fid, '���� -20000');
fprint(fid, '���� %d', -1200);
fprint(fid, '%s %s\n\n', '��װ', -24000);
detail = -[845 832.5 836 872.2 825 844];
fprint(fid, '%-5d %5.1f\n', [1:6; detail]);
fclose(fid);
