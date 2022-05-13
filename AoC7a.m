clear; clc; close all;

input = fileread('inputAoC7.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(input, '[,]', 'split');
for i = 1:length(data)
    data{i} = str2double(data{i});
end
data = cell2mat(data);
for i = 1:length(data)
    data(i) = data(i) + 1;
end

min = min(data);
max = max(data);

input = 5;

for i = 1:length(data) %získání matice o tom, kolik co stojí
    currentCost = 0;
    cost(i, data(i)) = 0;
    for j = 1:data(i)-min %do minima
        currentCost = currentCost + j;
        cost(i, data(i)-j) = currentCost;
    end
    currentCost = 0; %vlastní hodnota
    for j = 1:abs(data(i)-max) %do maxima
        currentCost = currentCost + j;
        cost(i, data(i)+j) = currentCost;
    end
end
currentLow = 9999999999;
for i = 1:length(cost)
    if (sum(cost(:, i)) < currentLow)
        currentLow = sum(cost(:, i));
        currentLowIndex = i - 1;
    end
end

