
% Question 39: Backward Chaining

% Initial facts
fact(rain).
fact(strong_wind).
fact(cloudy).

% Rules
rule(wet_ground, [rain]).
rule(carry_umbrella, [rain]).
rule(slippery_road, [wet_ground]).
rule(drive_slowly, [slippery_road]).
rule(storm_warning, [rain, strong_wind]).
rule(keep_windows_closed, [storm_warning]).

% Backward chaining
backward_chain(Goal) :-
    prove(Goal, []).

% Check whether the goal is an initial fact
prove(Goal, _) :-
    fact(Goal).

% Prove the goal using rules
prove(Goal, Visited) :-
    \+ member(Goal, Visited),
    rule(Goal, Conditions),
    prove_all(Conditions, [Goal|Visited]).

% Prove all required conditions
prove_all([], _).

prove_all([Goal|Goals], Visited) :-
    prove(Goal, Visited),
    prove_all(Goals, Visited).
