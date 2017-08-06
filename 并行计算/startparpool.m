function [] = startparpool(size)
isstart = 0;
nlabs = parpool('size');
if nlabs == 0
    isstart = 1;
end
if isstart == 1
    if nargin == 0
        parpool('local');
    else
        try
            parpool('local',size);
        catch ce
            parpool('local');
            size = parpool('size');
            display(ce.message);
            fprintf('输入size不正确，采用默认配置，size=%d',size);
        end
    end
else
    display('parpool 已启动');
    if nargin == 1
        if nlabs ~= size
            parpool close;
            startparpool(size);
        end
    end
end