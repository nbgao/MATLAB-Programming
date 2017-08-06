function [] = closeparpool

nlabs = parpool('size');
if nlabs > 0
    parpool close;
end