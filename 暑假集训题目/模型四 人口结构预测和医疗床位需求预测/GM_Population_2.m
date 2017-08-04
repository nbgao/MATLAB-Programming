
population_age_group1 = [104.76	105.26	106.46	107.0115	110.1881	112.116];
population_age_group2_1 = [178.54	177.55	175.52	173.1896	171.2197	171.2915];
population_age_group2_2 = [287.8	289.18	289.03	289.7711	289.4434	287.7203];
population_age_group2 = population_age_group2_1 + population_age_group2_2;
population_age_group3 = [118.02	123.72	129.51	136.6376	144.9064	152.4267];
population_total = [689.12	695.71	700.52	706.61	715.76	723.55];

n = length(population_total);

P1 = GM(population_age_group1);
P2 = GM(population_age_group2);
P3 = GM(population_age_group3);

P2_1 = GM(population_age_group2_1);
P2_2 = GM(population_age_group2_2);
P2 = P2_1 + P2_2;


P_total_1 = P1 + P2 + P3;
P_total_2 = GM(population_total);

P1_weight = P1 ./ P_total_1;
P2_weight = P2 ./ P_total_1;
P3_weight = P3 ./ P_total_1;


year1 = 2010:2015;
year2 = 2010:2035;


plot(year1,population_age_group1,'ro',year2,P1,'r-');
hold on
plot(year1,population_age_group2,'go',year2,P2,'g-');
hold on
plot(year1,population_age_group3,'bo',year2,P3,'b-');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('18岁以下人口','18岁以下人口预测曲线','18-60岁人口','18-60岁人口预测曲线','60岁以上人口','60岁以上人口预测曲线');

figure;
M = [P1_weight;P2_weight;P3_weight]';
bar(year2, M , 'stack');
set(gca,'xtick',year2);
grid on;
axis tight;
xlabel('时间(年)');
ylabel('比重');
legend('18岁以下人口比重','18-60岁人口比重','60岁以上人口比重');

figure;
plot(year2,P_total_1,'r',year2,P_total_2,'b');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('预测总人口数3段和','预测总人口数');
