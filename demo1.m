%% First demo, very simple, datasize: 10, 
%% until zero training error
%% draw emphasized characters
%% step by step.

load demo1.mat

[w, h] = ...
    adabstdemo(x, y, 10, @stumplearn, @stumpfunc, 0, 1, 1);
