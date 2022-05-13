clear; close all; clc;

depthfile = fileread('second.txt'); %input který nám dal AoC skopírovaný do .txt souboru
depthByLine = regexp(depthfile, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
data = regexp(depthByLine, ' ', 'split'); %rozdělím direction od čísla -> finální data

aim = 0;
horizontal = 0;
depth = 0;

for i = 1:length(data)
    switch cell2mat(data{i}(1)) %switch nebere data{i}(1), nutný převést na jinej formát
        case 'forward'
            horizontal = horizontal + str2double(data{i}(2)); %data v cellu se také musí převést na jiný formát pro matematické operace
            depth = depth + (aim * str2double(data{i}(2)));
        case 'down'
            aim = aim + str2double(data{i}(2));
        case 'up'
            aim = aim - str2double(data{i}(2));
    end
end

answer = depth * horizontal