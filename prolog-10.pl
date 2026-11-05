
% Question 35: Fruit and Color Using Backtracking

% Fruit and color facts
fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(orange, orange).
fruit_color(grapes, green).
fruit_color(grapes, purple).
fruit_color(mango, yellow).
fruit_color(strawberry, red).
fruit_color(watermelon, green).
fruit_color(papaya, orange).

% Find the color of a fruit
find_color(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Find fruits having a particular color
find_fruit(Color, Fruit) :-
    fruit_color(Fruit, Color).
