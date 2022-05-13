clear; clc; close all;

file = 'inputAoC10';

data = readmatrix(file, ...
    Delimiter = '', ...
    OutputType = 'string');

for i = 1:length(data) %provede pro všechny řádky
    l = data{i}; %vezme celý řádek
    while true %bude dělat dokuď budou dostupné dvojice závorek
        l_prev = l;
        l = strrep(strrep(strrep(strrep(l, '()', ''), '[]', ''), '{}', ''), '<>', '');
        if strcmp(l_prev, l) %ukončí while pokuď l a l_prev je stejný
            break;
        end
    end
    data{i} = l; %vrátí zbytek závorek do své celly
end

for i = 1:length(data) %pro každý řádek
    for j = data{i} %pro každý znak
        switch j %vybere co je navíc a podle toho přidá score
            case ")"
                data(i) = "";
                break;
            case "]"
                data(i) = "";
                break
            case "}"
                data(i) = "";
                break
            case ">"
                data(i) = "";
                break
        end
    end
end

data(data == "") = []; %smaže prázdné celly
score = zeros(1, length(data));
for i = 1:length(data) %pro každý řádek
    for j = length(data{i}):-1:1 %pro každý charakter, ale od konce
        switch data{i}(j)
            case "("
                score(i) = score(i) * 5 + 1;
            case "["
                score(i) = score(i) * 5 + 2;
            case "{"
                score(i) = score(i) * 5 + 3;
            case "<"
                score(i) = score(i) * 5 + 4;
        end
    end
end

answer = median(score)