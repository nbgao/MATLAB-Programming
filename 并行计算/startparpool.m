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
            fprintf('����size����ȷ������Ĭ�����ã�size=%d',size);
        end
    end
else
    display('parpool ������');
    if nargin == 1
        if nlabs ~= size
            parpool close;
            startparpool(size);
        end
    end
end