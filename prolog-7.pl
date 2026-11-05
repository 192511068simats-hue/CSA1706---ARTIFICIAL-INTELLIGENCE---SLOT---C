
% Question 32: Family Tree

% Gender facts
female(pam).
female(liz).
female(ann).
female(pat).

male(tom).
male(bob).
male(jim).

% Parent relationships
parent(tom, bob).
parent(pam, bob).
parent(tom, jim).
parent(pam, jim).
parent(bob, ann).
parent(liz, ann).
parent(bob, pat).
parent(liz, pat).

% Mother relationship
mother(M, C) :-
    female(M),
    parent(M, C).

% Father relationship
father(F, C) :-
    male(F),
    parent(F, C).

% Grandfather relationship
grandfather(G, C) :-
    male(G),
    parent(G, P),
    parent(P, C).

% Grandmother relationship
grandmother(G, C) :-
    female(G),
    parent(G, P),
    parent(P, C).

% Sibling relationship
sibling(X, Y) :-
    parent(P, X),
    parent(P, Y),
    X \= Y,
    \+ (parent(Q, X), parent(Q, Y), Q @< P).

% Sister relationship
sister(S, P) :-
    female(S),
    sibling(S, P).

% Brother relationship
brother(B, P) :-
    male(B),
    sibling(B, P).
