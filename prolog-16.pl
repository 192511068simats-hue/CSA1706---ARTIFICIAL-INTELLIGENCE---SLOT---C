
% PROLOG-16: Marcus and Caesar

% 1. Marcus was a man.
man(marcus).

% 2. Marcus was a Pompeian.
pompeian(marcus).

% 3. All Pompeians were Romans.
roman(X) :-
    pompeian(X).

% 4. Caesar was a ruler.
ruler(caesar).

% 5. Record explicitly established loyalty.
% No positive loyalty to Caesar is given.
:- dynamic loyalty_fact/2.

loyal_to(X, Y) :-
    loyalty_fact(X, Y).

% 6. Everyone is loyal to someone.
% Represents the existential statement.
loyal_to_someone(X) :-
    person(X).

% 7. All men are people.
person(X) :-
    man(X).

% 8. Marcus tried to assassinate Caesar.
tried_assassinate(marcus, caesar).

% People who try to assassinate a ruler
% are not loyal to that ruler.
not_loyal_to(X, Y) :-
    person(X),
    ruler(Y),
    tried_assassinate(X, Y).

% 9. All Romans are either loyal to Caesar
% or hate Caesar.
% Derive hatred when a Roman is not loyal.
hates(X, caesar) :-
    roman(X),
    not_loyal_to(X, caesar).
