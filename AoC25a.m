clear; clc; close all;

file = fileread('inputAoC25.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(file, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
for i = 1:length(data)-1 %odstraním zbytky
    data{i}(length(data{i})) = [];
end
skip = false;
count = 0;

while (~skip)
    oldData = data;
    tempData = data; %tempdata = mapa před posunem
    for i = 1:length(data) %pohyb >
        for j = 1:length(data{i})
            if (tempData{i}(j) == ">")
                try if (tempData{i}(j+1) == ".") %přeskočení jen o jedno pole
                        data{i}(j+1) = ">";
                        data{i}(j) = ".";
                    end
                end
                if (j == length(data{i})) %přeskočení o celou mapu
                    try if (tempData{i}(1) == ".")
                        data{i}(1) = ">";
                        data{i}(j) = ".";
                    end
                end
                end
            end
        end
    end
    
    tempData = data;
    for i = 1:length(data) %pohyb v
        for j = 1:length(data{i})
            if (tempData{i}(j) == "v")
                try if (tempData{i+1}(j) == ".") %přeskočení jen o jedno pole
                        data{i+1}(j) = "v";
                        data{i}(j) = ".";
                    end
                end
                if (i == length(data)) %přeskočení o celou mapu
                    try if (tempData{1}(j) == ".")
                        data{1}(j) = "v";
                        data{i}(j) = ".";
                    end
                end
                end
            end
        end
    end
    
    count = count + 1;
    if (isequal(oldData, data))
        skip = true;
    end
end