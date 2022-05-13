clear; clc; close all;

input = fileread('inputAoC8.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(input, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé řádky
data = extractAfter(data, '|'); %chci jen to co je za |
data = regexp(data, ' ', 'split'); % rozdělit každý signál na svůj vlastní array
data = strtrim(data);

eight = 0;
seven = 0;
four = 0;
one = 0;
for i = 1:length(data)
    for j = 2:5
        switch (strlength(data{i}(j)))
            case 2
                one = one + 1;
            case 4
                four = four + 1;
            case 3
                seven = seven + 1;
            case 7
                eight = eight + 1;
        end
    end
end

answer = one+four+seven+eight
