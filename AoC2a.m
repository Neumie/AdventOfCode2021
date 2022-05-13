clear; close all; clc;

depthfile = fileread('second.txt'); %input který nám dal AoC skopírovaný do .txt souboru
depthByLine = regexp(depthfile, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
data = regexp(depthByLine, ' ', 'split'); %rozdělím direction od čísla -> finální data

horizontal = 0;
depth = 0;
for i = 1:length(data)
    if data{i}(1) == "forward"
        horizontal = horizontal + str2double(data{i}(2));
    elseif data{i}(1) == "down"
        depth = depth + str2double(data{i}(2));
    else
        depth = depth - str2double(data{i}(2));
    end
end
answer = depth * horizontal