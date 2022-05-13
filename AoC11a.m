clear; close; clc

data = readmatrix('inputAoC11.txt', VariableWidth = ones(10, 1));
data = padarray(data, [1 1], NaN); %dá margin 1 matrixu. hodnoty NaN -> nemusíme používat try, catch
flashCount = 0;
for i = 1:1000 %steps
    data = data + 1; %přičtu každému prvku 1

    [y, x] = find(data > 9); %uložím lokace 10tek do 'y' a 'x'
    for j = 1:length(x) %probliknutí každého prvku který je v 'x' a 'y'
        data = flash(y(j), x(j), data);
    end

    flashCount = flashCount + sum(data == -Inf, 'all');
    data(data == -Inf) = 0;

    if (sum(data == 0, 'all') == 100)
        asn = i
        break;
    end
end

function data = flash(y, x, data)
        a = y; %y
        b = x; %x

        d = data(y, x);
        if (d < 10) || isnan(d), return, end %stopne funkci, když vybraný 
        
        data(a-1:a+1, b-1:b+1) = data(a-1:a+1, b-1:b+1) + 1; %přidání 1 do okolí a sama sebe
        data(y, x) = -Inf; %nesmí probliknout znovu v tento step

        data = flash(a-1, b-1, flash(a, b-1, flash(a+1, b-1, data))); %flashnutí spodní části
        data = flash(a-1, b, flash(a+1, b, data)); %flashnutí prostředku
        data = flash(a-1, b+1, flash(a, b+1, flash(a+1, b+1, data))); % flashnutí vrchu
end