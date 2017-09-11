function route = perturb(route_old, method)
route = route_old;
numbercities = length(route);
city1 = ceil(numbercities*rand);
city2 = ceil(numbercities*rand);
switch method
    case 'reverse'
        cmin = min(city1, city2);
        cmax = max(city1, city2);
        route(cmin:cmax) =route(cmax:-1:cmin);
    case 'swap'
        route([city1, city2]) = route([city2, city1]);
end