clear; close all; clc

file = fileread('inputAoC22test.txt'); %input který nám dal AoC skopírovaný do .txt souboru
data = regexp(file, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
data = regexp(data, ' ', 'split'); %rozdělím direction od čísla -> finální data

for i = 1:length(data) %on/off
    onoff{i} = data{1, i}{1, 1};
end
for i = 1:length(data) %xyz
    data{i} = data{1, i}{1, 2};
end
match = ["x=","y=","z="];
data = erase(data,match);
data = regexp(data, ',', 'split');
for i = 1:length(data)
    for j = 1:3
        xyz{i, j} = str2double(regexp(data{1, i}{1, j},'(+|-)?\d+(\.\d+)?','match')) + 51; %od 1 do 101
    end
end

maximum = 0;
for i = 1:length(xyz)
    for j = 1:3
        if (max(xyz{i, j}) > maximum)
            maximum = max(xyz{i, j});
        end
    end
end

cube = zeros(maximum, maximum, maximum);

for i = 1:length(xyz)
for x = xyz{i, 1}(1):xyz{i, 1}(2)
    if (x > 101 || x < 1) %pouze od -50 do 50
        continue;
    end
    for y = xyz{i, 2}(1):xyz{i, 2}(2)
        if (y > 101 || y < 1)
            continue;
        end
        for z = xyz{i, 3}(1):xyz{i, 3}(2)
            if (z > 101 || z < 1)
                continue;
            end
            
            if (onoff(i) == "on")
                cube(x, y, z) = 1;
            else
                cube(x, y, z) = 0;
            end

        end
    end
end
end

sum = 0;
for i = 1:length(cube)
    for j = 1:length(cube)
        for k = 1:length(cube)
            if (cube(i, j, k) == 1)
                sum = sum + 1;
            end
        end
    end
end