clear; clc; close all;

input = fileread('inputAoC5.txt'); %input který nám dal AoC skopírovaný do .txt souboru
inputByLine = regexp(input, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé řádky
data = regexp(inputByLine, '[,>-]', 'split');

map = zeros(15);

for i = 1:length(data)
    x1 = str2double(data{i}(1))+1;
    y1 = str2double(data{i}(2))+1;
    x2 = str2double(data{i}(4))+1;
    y2 = str2double(data{i}(5))+1;

    if (x1 > x2)
        temp = x2;
        x2 = x1;
        x1 = temp;
    end
    if (y1 > y2)
        temp = y2;
        y2 = y1;
        y1 = temp;
    end

    if (x1 == x2)
        map(y1:y2, x1) = map(y1:y2, x1) + 1;
    elseif (y1 == y2)
        map(y1, x1:x2) = map(y1, x1:x2) + 1;
    end


end

sum(map(:) > 1)

%map(x, y) = map(x, y) + 1;
%str2double(data{1}(1)) %první x data