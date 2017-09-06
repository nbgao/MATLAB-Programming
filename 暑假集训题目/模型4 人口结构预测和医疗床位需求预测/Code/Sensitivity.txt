k = 1;
for TFR = 1.2:0.2:2.2
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
    
    fertility_rate = (2.5 * TFR + 1) * fertility_rate;    % 调整后生育率

    [G,P] = Leslie(population_total_2007 , female_rate , fertility_rate , survival_rate , migrant_rate);
    G,P

    year_group = (2037-2007)/5;
    
    color_point = ['ro','yo','go','co','bo','ko'];
    color_line = ['r-','y-','g-','c-','b-','k-'];
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
    
    year2 = 2007:5:2037;
    xx = 2007:1:2037;
    
    plot(year2,P_total,color_point(k:k+1)); hold on;
    yy_P_total = spline(year2,P_total,xx);
    plot(xx,yy_P_total,color_line(k:k+1));hold on;
    set(gca,'xtick',year2);
    grid on;
    xlabel('时间(年)');
    ylabel('总人口(人)');
    
    k = k+2;
end