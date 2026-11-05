
% Question 36: Best First Search Algorithm

% Graph connections
edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).
edge(c, f).
edge(c, g).
edge(d, g).
edge(e, g).
edge(f, g).

% Heuristic values
heuristic(a, 7).
heuristic(b, 6).
heuristic(c, 4).
heuristic(d, 5).
heuristic(e, 3).
heuristic(f, 2).
heuristic(g, 0).

% Best First Search
best_first(Start, Goal, Path) :-
    heuristic(Start, H),
    best_first_search([H-[Start]], Goal, [], ReversePath),
    reverse(ReversePath, Path).

% Goal reached
best_first_search(
    [_Priority-[Goal|RestPath] | _],
    Goal,
    _,
    [Goal|RestPath]
).

% Search using heuristic priority
best_first_search(
    [_Priority-[Current|RestPath] | Queue],
    Goal,
    Visited,
    Path
) :-
    ( member(Current, Visited) ->
        best_first_search(Queue, Goal, Visited, Path)
    ;
        findall(
            H-[Next,Current|RestPath],
            ( edge(Current, Next),
              \+ member(Next, Visited),
              heuristic(Next, H)
            ),
            NewNodes
        ),
        append(Queue, NewNodes, Combined),
        keysort(Combined, Sorted),
        best_first_search(Sorted, Goal, [Current|Visited], Path)
    ).
