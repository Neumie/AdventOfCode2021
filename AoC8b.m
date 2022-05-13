clear; clc; close all;

input = fileread('inputAoC8.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(input, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé řádky
data = regexp(data, ' ', 'split'); % rozdělit každý signál na svůj vlastní array
data = strtrim(data);

segments = {'abcdefg', 'abcdefg', 'abcdefg', 'abcdefg', 'abcdefg', 'abcdefg', 'abcdefg'};

for i = 1:length(data)
    for j = 1:length(data{1})
        if strlength(data{i}(j)) == 2
            segments{i}(1) = data{i}(j);
            break;
        end
    end
end
segments{1}(1)