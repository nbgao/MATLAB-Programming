route = randperm(numberofcities);
temperature = 1000;
cooling_rate = 0.95;    % 降温系数
Titerations = 1;    % 用来控制降温的循环
previous_distance = totaldistance(route);    % 计算路径总长
while temperature > 1.0    % 循环继续条件
    temp_route = perturb(route, 'reverse');    % 扰动产生邻解
    current_distance = totaldistance(temp_route);    % 路长
    diff = current_distance - previous_distance;
    if (diff<0) || (rand<exp(-diff/temperature))
        route = temp_route;    % 接受当前解
        previous_distance = current_distance;
        Titerations = Titerations + 1;
    end
    if Titerations >= 10    % 每10步降温
        temperature = cooling_rate*temperature;
        Titerations = 0;
    end
end