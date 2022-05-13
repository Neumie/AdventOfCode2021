%AoC 2021 - 1
clear; close all; clc

depth = fopen('first.txt', 'r'); %input který nám dal AoC skopírovaný do .txt souboru
formatSpec = '%d'; %určení, že data jsou číslo (nechtělo se mi hledat označení pro integer)

data = fscanf(depth, formatSpec); %načtení dat

increase = 0;
for i = 1:length(data)-1
    if data(i) < data(i+1)
        increase = increase + 1;
    end
end