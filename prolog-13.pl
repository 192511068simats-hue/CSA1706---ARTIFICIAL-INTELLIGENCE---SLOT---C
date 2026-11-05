
% Question 38: Forward Chaining

% Initial facts
initial_fact(rain).
initial_fact(cloudy).
initial_fact(strong_wind).

% Rules
rule(wet_ground, [rain]).
rule(carry_umbrella, [rain]).
rule(slippery_road, [wet_ground]).
rule(drive_slowly, [slippery_road]).
rule(storm_warning, [rain, strong_wind]).
rule(keep_windows_closed, [storm_warning]).

% Check whether all conditions are satisfied
all_in([], _).

all_in([X|Xs], Facts) :-
    member(X, Facts),
    all_in(Xs, Facts).

% Forward chaining process
forward_chain(Facts, FinalFacts) :-
    findall(
        Conclusion,
        (rule(Conclusion, Conditions),
         all_in(Conditions, Facts),
         \+ member(Conclusion, Facts)),
        NewFacts0
    ),
    sort(NewFacts0, NewFacts),
    ( NewFacts = [] ->
        FinalFacts = Facts
    ;
        append(Facts, NewFacts, UpdatedFacts),
        forward_chain(UpdatedFacts, FinalFacts)
    ).

% Start forward chaining
run_forward_chaining(FinalFacts) :-
    findall(Fact, initial_fact(Fact), InitialFacts),
    forward_chain(InitialFacts, FinalFacts).
