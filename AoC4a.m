close all; clc; clear;

input = fileread('inputAoC4test.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(input, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé řádky
data = regexp(data, ' ', 'split'); % rozdělit každý signál na svůj vlastní array
data = strtrim(data);

order = data{1} %pořadí ve kterém se čísla tahaj
order = strsplit(order{1}, ','); % rozdělit každý signál na svůj vlastní array
data(1) = []; %odebrání pořadí z dat
numberOfGames = floor(length(data)/5) %počet různých her -> 3

for i = 1:numberOfGames %odebrání nepotřebných částí
    data((i*5) - 4) = [];
end

for i = 1:length(data) %formátování každého řádku
    data{i}(strcmp('', data{i})) = []
end

sudoku = cell(numberOfGames*5, 5);
for i = 1:length(data) %rozřazení dat
    for j = 1:5
        sudoku(i, j) = data{i}(j);
    end
end

for i = 1:5 %převedení arraychar na double
    for j = 1:numberOfGames*5
        sudoku{j, i} = str2double(sudoku(j, i));
    end
end
for i = 1:length(order) %převedení orderu taky na double
    order{i} = str2double(order(i))
end

sudokuBoolean = zeros(numberOfGames*5, 5);
for i = 1:5%length(order) %přidávání losovaných čísel

    for j = 1:numberOfGames*5 %kontrola pro každé políčko jestli tam zrovna není vylosované číslo
        for k = 1:5
            if (sudoku{j, k}) == order{i}
                sudokuBoolean(j, k) = 1;
            end
        end
    end

    


end


