
% Food, Eating and Likes Knowledge Base

% 1. John likes all kinds of food.
likes(john, X) :-
    food(X).

% 2. Apple and vegetables are food.
food(apple).
food(vegetables).

% 3. Anything anyone eats and is not killed by
% is considered food.
not_killed(Person) :-
    alive(Person),
    \+ killed(Person).

:- dynamic killed/1.

food(Item) :-
    eats(Person, Item),
    not_killed(Person).

% 4. Anil eats peanuts and is still alive.
eats(anil, peanuts).
alive(anil).

% 5. Harry eats everything that Anil eats.
eats(harry, Item) :-
    eats(anil, Item).

% 6. Query: John likes peanuts.
% This is inferred from the above facts and rules.
