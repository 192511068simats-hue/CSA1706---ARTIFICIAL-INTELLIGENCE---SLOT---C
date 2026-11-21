
% PROLOG-17: FORWARD CHAINING

% Step 1: Initial known facts
known_fact(fever).
known_fact(cough).

% Step 2: Inference rule R1
% Fever AND Cough -> Common Cold
rule(common_cold, [fever, cough]).

% Step 3: Check whether all rule conditions are satisfied
all_conditions_true([], _).

all_conditions_true([Fact|Rest], Facts) :-
    member(Fact, Facts),
    all_conditions_true(Rest, Facts).

% Step 4: Forward chaining algorithm
forward_chain(Facts, FinalFacts) :-

    findall(
        Conclusion,
        (
            rule(Conclusion, Conditions),
            all_conditions_true(Conditions, Facts),
            \+ member(Conclusion, Facts)
        ),
        NewFactsList
    ),

    sort(NewFactsList, NewFacts),

    (
        NewFacts = [] ->
        FinalFacts = Facts
    ;
        forall(
            member(NewFact, NewFacts),
            format('New fact derived: ~w~n', [NewFact])
        ),

        append(Facts, NewFacts, UpdatedFacts),

        forward_chain(UpdatedFacts, FinalFacts)
    ).

% Step 5: Start forward chaining
run_forward_chaining(FinalFacts) :-

    findall(Fact, known_fact(Fact), InitialFacts),

    write('Initial Known Facts: '),
    write(InitialFacts),
    nl,

    forward_chain(InitialFacts, FinalFacts),

    write('Final Working Memory: '),
    write(FinalFacts),
    nl,

    write('Forward Chaining Completed.'),
    nl.
