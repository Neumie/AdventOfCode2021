clear; clc; close all;

input = fileread('inputAoC6.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(input, '[,]', 'split');

for i = 1:length(data)
    data{i} = str2double(data{i});
end

new = 0;
for day = 1:80
    for i = 1:length(data)
        if data{i} == 0 %reset
            data{i} = 7;
            new = new + 1;
        end
        data{i} = data{i} - 1;
    end
    for j = 1:new
        data{length(data)+1} = 8; %nová ryba
    end
    new = 0;
end