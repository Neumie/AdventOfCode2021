function [image, instructions] = AoC20aa
file = fileread('inputAoC20.txt'); %input který nám dal AoC skopírovaný do .txt souboru
    data = regexp(file, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
    instructions = cell2mat(data(1));
    data(2) = [];
    data(1) = [];
    strtrim(data);
        margin = 1;
        image= zeros(length(data)+margin*2, length(data)+margin*2);
        for j = 1:length(data{2})-1
            for i = 1:length(data{2})-1
                image(i+margin, j+margin) = data{i}(j);
            end
        end 
        for x = 1:length(data)
            for y = 1:length(data)
                if (image(x+margin, y+margin) == 35) %znak # v ascii or smth
                    image(x+margin, y+margin) = 1;
                else
                    image(x+margin, y+margin) = 0;
                end
            end
        end
end