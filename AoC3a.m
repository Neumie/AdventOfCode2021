clear; clc; close all;

binary = fileread('third.txt'); %input který nám dal AoC skopírovaný do .txt souboru
binaryByLine = regexp(binary, '\n', 'split'); %použiju delimiter \n pro rozdělení dat na jednotlivé instrukce
data = regexp(binaryByLine, ' ', 'split'); %rozdělím direction od čísla -> finální data
clear binary binaryByLine;

numberOfCollumns = 12;
numberOfRows = length(data); %1000
count = [0 0 0 0 0 0 0 0 0 0 0 0]; %počet jedniček v každém řádku
gamma = [0 0 0 0 0 0 0 0 0 0 0 0];
epsilon = [0 0 0 0 0 0 0 0 0 0 0 0];

for i = 1:numberOfRows
    for j = 1:numberOfCollumns
        a = char(data{i});
        count(j) = count(j) + str2double(a(j));
    end
end

for i = 1:length(count)
    if count(i) < numberOfRows/2
        gamma(i) = 0;
        epsilon(i) = 1;
    else
        gamma(i) = 1;
        epsilon(i) = 0;
    end
end

strGamma = num2str(gamma);
strGamma(isspace(strGamma)) = '';
gamma = bin2dec(strGamma);
strEpsilon = num2str(epsilon);
strEpsilon(isspace(strEpsilon)) = '';
epsilon = bin2dec(strEpsilon);

newCount = data;
anotherCount = {};

for j = 1:numberOfCollumns-1
    if mod(j, 2) == 1
        if count(j) > numberOfRows/2 % pokuď 1 převládaj tak
            for i = 1:numberOfRows %zopakuje se pro každej řádek
                str = cell2mat(newCount{i});
                if str(1) == '1' %pokuď zbývající string začíná jedničkou
                    smth = cell2mat(newCount{i}); %obsah řádku
                    anotherCount{length(anotherCount)+1} = smth((j+1):numberOfCollumns); %obsah řádku se dá do nové celly
                end
            end
        else %pokuď 0 převládaj
            for i = 1:numberOfRows %zopakuje se pro každej řádek
                str = cell2mat(newCount{i});
                if str(1) == '0' %pokuď zbývající string začíná nulou
                    smth = cell2mat(newCount{i});
                    anotherCount{length(anotherCount)+1} = smth((j+1):numberOfCollumns);
                end
            end
        end
        newCount = {};
    else
        if count(j) > numberOfRows/2 % pokuď 1 převládaj tak
            for i = 1:numberOfRows %zopakuje se pro každej řádek
                str = cell2mat(anotherCount{i});
                if str(1) == '1' %pokuď zbývající string začíná jedničkou
                    smth = cell2mat(anotherCount{i}); %obsah řádku
                    newCount{length(newCount)+1} = smth((j+1):numberOfCollumns); %obsah řádku se dá do nové celly
                end
            end
        else %pokuď 0 převládaj
            for i = 1:numberOfRows %zopakuje se pro každej řádek
                str = cell2mat(anotherCount{i});
                if str(1) == '0' %pokuď zbývající string začíná nulou
                    smth = cell2mat(anotherCount{i});
                    newCount{length(newCount)+1} = smth((j+1):numberOfCollumns);
                end
            end
        end
        anotherCount = {};
    end
end