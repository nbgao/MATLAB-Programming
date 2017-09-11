route = randperm(numberofcities);
temperature = 1000;
cooling_rate = 0.95;    % ����ϵ��
Titerations = 1;    % �������ƽ��µ�ѭ��
previous_distance = totaldistance(route);    % ����·���ܳ�
while temperature > 1.0    % ѭ����������
    temp_route = perturb(route, 'reverse');    % �Ŷ������ڽ�
    current_distance = totaldistance(temp_route);    % ·��
    diff = current_distance - previous_distance;
    if (diff<0) || (rand<exp(-diff/temperature))
        route = temp_route;    % ���ܵ�ǰ��
        previous_distance = current_distance;
        Titerations = Titerations + 1;
    end
    if Titerations >= 10    % ÿ10������
        temperature = cooling_rate*temperature;
        Titerations = 0;
    end
end