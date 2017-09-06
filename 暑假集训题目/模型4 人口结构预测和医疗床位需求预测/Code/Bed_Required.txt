
population_total = [621.58	629.14	636.81	642.78	651.68	660.45	666.31	672.35	677.64	683.38	689.12	695.71	700.52	706.61	715.76	723.55];
P_total = [7563761,7866673,8039990,8101203,8155486];
bed_required = [27166	27063	27609	29144	31738	33251	33972	36928	38114	40226	42828	45291	49471	52056	55779	63632];
bed_required_rate = bed_required/10 ./ population_total;

n = length(population_total);

br = GM(bed_required_rate);

year1 = 2000:2015;
year2 = 2000:2037;

for i = 1:5
    br_i(i) = br(5*i+13);
end

BR = [];
BR(1) = bed_required(13);
for i = 1:5
    BR(i+1) = P_total(i) * br_i(i)/1000;
end

% xlswrite('问题4结果.xlsx',br_i,1,'B2:G2');
% xlswrite('问题4结果.xlsx',BR,1,'B3:G3');


figure;
plot(year1,bed_required_rate,'bo',year2,br,'b-');
hold on
%set(gca,'xtick',year2);
grid on;
xlabel('时间(年)');
ylabel('医疗床位需求率(张/千人)');
legend('医疗床位需求率','医疗床位需求率预测曲线');

year3 = 2012:5:2037;
figure;
plot(year3,BR,'bo-');
grid on;
xlabel('时间(年)');
ylabel('医疗床位需求量(张)');
legend('医疗床位需求量预测曲线');
