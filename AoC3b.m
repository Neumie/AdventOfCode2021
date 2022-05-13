clear; clc; close all

binary = fileread('inputAoC3.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(binary, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
data = strtrim(data); %odstraním newline znaky
tempData = data;

i = 1;
while (length(data) ~= 1) %oxygen generator rating
    sum = 0;
    for j = 1:length(data) %zjistí sumu i-tého sloupce
        sum = sum + str2double(data{j}(i));
    end

    if (sum >= length(data)/2) %zjistí jestli převládá 0/1
        keep = 1;
    else
        keep = 0;
    end

    for j = length(data):-1:1 %odstraní sloupce které nevyhovují
        if (str2double(data{j}(i)) ~= keep)
            data(j) = [];
        end
    end
    i = i + 1;
end
ogr = data{1};

data = tempData; %načtění dat zpět
i = 1;
while (length(data) ~= 1) %csr (změní se jen keep z 0 na 1)
    sum = 0;
    for j = 1:length(data) %zjistí sumu i-tého sloupce
        sum = sum + str2double(data{j}(i));
    end

    if (sum >= length(data)/2) %zjistí jestli převládá 0/1
        keep = 0;
    else
        keep = 1;
    end

    for j = length(data):-1:1 %odstraní sloupce které nevyhovují
        if (str2double(data{j}(i)) ~= keep)
            data(j) = [];
        end
    end
    i = i + 1;
end
csr = data{1};

answer = bin2dec(csr) * bin2dec(ogr)
