function output = AoC20a(image, instructions)
    S = zeros(length(image), length(image));
    for x = 1:length(S)
        for y = 1:length(S)
            i = 1;
            try S(y, x) = S(y, x) + image(y+1, x+1)*i; end %pravý dolní
            i = i * 2;
            try S(y, x) = S(y, x) + image(y+1, x)*i; end %prostřední dolní
            i = i * 2;
            try S(y, x) = S(y, x) + image(y+1, x-1)*i; end %levý dolní
            i = i * 2;
            try S(y, x) = S(y, x) + image(y, x+1)*i; end %pravý prostřední
            i = i * 2;
            try S(y, x) = S(y, x) + image(y, x)*i; end %prostřední prostřední
            i = i * 2;
            try S(y, x) = S(y, x) + image(y, x-1)*i; end %levý prostřední
            i = i * 2;
            try S(y, x) = S(y, x) + image(y-1, x+1)*i; end %pravý vrchní
            i = i * 2;
            try S(y, x) = S(y, x) + image(y-1, x)*i; end %prostřední vrchní
            i = i * 2;
            try S(y, x) = S(y, x) + image(y-1, x-1)*i; end % levý vrchní
        end
    end
    
    for x = 1:length(S)
        for y = 1:length(S)
            if (instructions(S(y,x)+1) == 35) %#
                S(y,x) = 1;
            elseif (instructions(S(y, x)+1) == 46) %.
                S(y,x) = 0;
            end
        end
    end

    margin = 1;
    output = zeros(length(S)+margin*2, length(S)+margin*2);
    for x = 1:length(S)
        for y = 1:length(S)
            output(y+1, x+1) = S(y, x);
        end
    end

end