clear; clc; close all;

pos1 = 1; %Player 1 starting position: 4
pos2 = 6; %Player 2 starting position: 8
tempPos = 0;
points1 = 0;
points2 = 0;
tempPoints = 0;
die = 1;
turns = 0;

while points1 < 1000 && points2 < 1000
    if (mod(turns, 2) == 0) %loads current player
            tempPos = pos1;
            tempPoints = points1;
        else
            tempPos = pos2;
            tempPoints = points2;
    end

    for i = 1:3
        tempPos = tempPos + die;
        if (die < 100) %die reset or incrementation
                die = die + 1;
        else
                die = 1;
        end
    end

    if (mod(tempPos, 10) == 0) %adding points
        tempPoints = tempPoints + 10;
    else
        tempPoints = tempPoints + mod(tempPos, 10);
    end
        
    if (mod(turns, 2) == 0) %unloads current player
            pos1 = tempPos;
            points1 = tempPoints;
    else
            pos2 = tempPos;
            points2 = tempPoints;
    end

    turns = turns + 1; %turn counter
end
turns = turns * 3;

