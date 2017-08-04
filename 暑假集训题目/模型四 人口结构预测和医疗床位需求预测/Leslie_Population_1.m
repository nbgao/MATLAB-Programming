clear

population_female_2007 = [111957	127796	162277	220563	280869	248833	242778	301401	331096	261600	273954	209498	146865	101408	114027	85119	53976	25052	8164	1642	241	28]';
population_total_2007 = [230650	252371	335269	451026	578014	507800	483297	599048	673750	544836	571075	427395	294064	203026	228770	165719	97842	41463	12588	2429	324	41]';
% 死亡率
death_rate = [0.00244	0.00023	0.00017	0.00027	0.00051	0.00059	0.00068	0.00123	0.00188	0.00312	0.00542	0.00869	0.01362	0.02194	0.04094	0.06597	0.09481	0.15007	0.24811	0.37893	0.58055	0.87256]';
% 生育率
fertility_rate =  [0	0	0	0.00383	0.09367	0.10378	0.05234	0.02041	0.0067	0.00519	0	0	0	0	0	0	0	0	0	0	0	0]';
% 女性比例
female_rate = population_female_2007 ./ population_total_2007;

%存活率
survival_rate = 1 - death_rate;

% 2008年迁入人口率
population_migrant_2008 = 36674;
population_2007 = sum(population_total_2007);
%migrant_rate = 8 * population_migrant_2008 / population_2007;
migrant_rate = 0.05;

% 修正生育率
% TFR = sum(fertility_rate*5);     %  总和生育率
TFR = 2.2;

fertility_rate = (2.5 * TFR + 1) * fertility_rate;    % 调整后生育率


age_range = 0:5:109;
plot(age_range,female_rate,'r', age_range,fertility_rate,'g', age_range,survival_rate,'b');
set(gca,'xtick',age_range);
grid on;
axis tight;
xlabel('年龄(岁)');
legend('女性人口比例','年龄别生育率','存活率');

[G,P] = Leslie(population_total_2007 , female_rate , fertility_rate , survival_rate , migrant_rate);
G,P

year_group = (2037-2007)/5;
for i = 1:year_group+1
    P1(i) = sum(G(1:4,i));
    P2(i) = sum(G(5:13,i));
    P3(i) = sum(G(14:22,i));    % 延迟退休年龄至65周岁
    P_total(i) = sum(G(:,i));
end
P1_weight = P1 ./ P_total;
P2_weight = P2 ./ P_total;
P3_weight = P3 ./ P_total;

S = 1 - P3_weight
S1 = P1_weight ./ P2_weight;
S2 = P3_weight ./ P2_weight;



    

% xlswrite('第2问结果.xlsx',P1,1,'B2:H2');
% xlswrite('第2问结果.xlsx',P2,1,'B3:H3');
% xlswrite('第2问结果.xlsx',P3,1,'B4:H4');
% xlswrite('第2问结果.xlsx',P_total,1,'B5:H5');

% xlswrite('第3问结果.xlsx',S,1,'C2:I2');
% xlswrite('第3问结果.xlsx',S1,1,'C19:I19');
% xlswrite('第3问结果.xlsx',S2,1,'C29:I29');


year2 = 2007:5:2037;

for i = 1:7
    figure;
    barh(age_range,G(:,i),1,'group'); hold on;
    axis tight;
    xlabel('人口数(人)');
    ylabel('年龄(岁)');
    title(year2(i));
end



xx = 2007:1:2037;
figure; grid on;
plot(year2,P3,'bo'); hold on;
yy_P3 = spline(year2,P3,xx);
plot(xx,yy_P3,'b-'); hold on;

plot(year2,P2,'go');hold on;
yy_P2 = spline(year2,P2,xx);
plot(xx,yy_P2,'g-'); hold on;

plot(year2,P1,'ro'); hold on
yy_P1 = spline(year2,P1,xx);
plot(xx,yy_P1,'r-'); hold on;

set(gca,'xtick',year2);
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('','65岁以上人口预测曲线','','20-65岁人口预测曲线','','20岁以下人口预测曲线');


figure; grid on;
M = [P1_weight;P2_weight;P3_weight]';
bar(year2, M , 'stack');
set(gca,'xtick',year2);
axis tight;
xlabel('时间(年)');
ylabel('比重');
legend('20岁以下人口比重','20-65岁人口比重','65岁以上人口比重');

figure;
plot(year2,P_total,'bo'); hold on;
yy_P_total = spline(year2,P_total,xx);
plot(xx,yy_P_total,'b-');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('','预测人口数总和');
