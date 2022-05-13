clear; clc; close all;

file = 'inputAoC10test';

data = readmatrix(file, ...
    Delimiter = '', ...
    OutputType = 'string');

for i = 1:length(data) %provede pro všechny řádky
    l = data{i} %vezme celý řádek
    while true %bude dělat dokuď budou dostupné dvojice závorek
        l_prev = l
        l = strrep(strrep(strrep(strrep(l, '()', ''), '[]', ''), '{}', ''), '<>', '');
        if strcmp(l_prev, l) %ukončí while pokuď l a l_prev je stejný
            break;
        end
    end
    data{i} = l; %vrátí zbytek závorek do své celly
end

score = 0;
for i = 1:length(data) %pro každý řádek
    for j = data{i} %pro každý znak
        switch j %vybere co je navíc a podle toho přidá score
            case ")"
                score = score + 3; data(i) = "";
                break;
            case "]"
                score = score + 57; data(i) = "";
                break
            case "}"
                score = score + 1197; data(i) = "";
                break
            case ">"
                score = score + 25137; data(i) = "";
                break
        end
    end
end