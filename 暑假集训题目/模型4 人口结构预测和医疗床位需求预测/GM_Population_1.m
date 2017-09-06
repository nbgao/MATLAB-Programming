syms a b;
c = [a b]';
year1 = 2000:2015;
year2 = 2000:2035;

population_total = [621.58	629.14	636.81	642.78	651.68	660.45	666.31	672.35	677.64	683.38	689.12	695.71	700.52	706.61	715.76	723.55];
population_male = [319.09	322.78	326.62	329.04	332.62	336.12	338.23	340.5	342.45	344.51	346.56	349.09	350.9	353.32	357.26	360.68];
population_female = [302.49	306.36	310.19	313.74	319.06	324.33	328.08	331.85	335.19	338.87	342.56	346.62	349.62	353.29	358.5	362.87];

populaiton_age1 = [104.76	105.26	106.46	107.0115	110.1881	112.116];
population_age2 = [178.54	177.55	175.52	173.1896	171.2197	171.2915];
population_age3 = [287.8	289.18	289.03	289.7711	289.4434	287.7203];
population_age4 = [118.02	123.72	129.51	136.6376	144.9064	152.4267];

sex_rate1 = population_male ./ population_female;

predict_male = GM(population_male);
predict_female = GM(population_female);
predict_total1 = predict_male + predict_female;
predict_total2 = GM(population_total);

plot(year1,population_male,'bo',year2,predict_male,'b-');
hold on
plot(year1,population_female,'ro',year2,predict_female,'r-');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('男性人口','男性人口预测曲线','女性人口','女性人口预测曲线');


figure;
sex_rate2 = predict_male./predict_female;
plot(year1,sex_rate1,'o',year2,sex_rate2,'b');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('性别比');
legend('男女性别比','男女性别比预测曲线');


figure;
plot(year2,predict_total1,'r',year2,predict_total2,'b');
set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('人口数(万人)');
legend('预测男性人口数+预测女性人口数','预测总人口数');