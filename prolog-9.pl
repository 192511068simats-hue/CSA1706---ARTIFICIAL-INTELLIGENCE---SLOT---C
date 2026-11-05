
% Question 34: Monkey Banana Problem

% Possible locations
place(door).
place(window).
place(middle).

% Initial state: Monkey at door, box at window
% State = state(Monkey, Box, Position, Banana)

% Monkey walks from one place to another
action(state(M, B, floor, no),
       walk(M, N),
       state(N, B, floor, no)) :-
    place(N),
    M \= N.

% Monkey pushes the box to the middle
action(state(P, P, floor, no),
       push_box(P, middle),
       state(middle, middle, floor, no)) :-
    P \= middle.

% Monkey climbs onto the box
action(state(middle, middle, floor, no),
       climb,
       state(middle, middle, on_box, no)).

% Monkey grasps the banana
action(state(middle, middle, on_box, no),
       grasp,
       state(middle, middle, on_box, yes)).

% Initial state
monkey_banana(Plan) :-
    Initial = state(door, window, floor, no),
    solve(Initial, [Initial], Plan).

% Goal state
solve(state(_, _, _, yes), _, []).

% Find the solution
solve(State, Visited, [Action|Plan]) :-
    action(State, Action, Next),
    \+ member(Next, Visited),
    solve(Next, [Next|Visited], Plan).
