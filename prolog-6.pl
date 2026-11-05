
% Question 31: Bird Flying Database

% Bird facts
bird(sparrow).
bird(pigeon).
bird(eagle).
bird(parrot).
bird(ostrich).
bird(penguin).

% Flightless birds
flightless(ostrich).
flightless(penguin).

% Rule to check flying birds
can_fly(Bird) :-
    bird(Bird),
    \+ flightless(Bird).

% Rule to check non-flying birds
cannot_fly(Bird) :-
    bird(Bird),
    flightless(Bird).

% Display whether a bird can fly
check_bird(Bird) :-
    ( bird(Bird) ->
        ( flightless(Bird) ->
            format('~w cannot fly.~n', [Bird])
        ;
            format('~w can fly.~n', [Bird])
        )
    ;
        format('~w is not in the bird database.~n', [Bird])
    ).
