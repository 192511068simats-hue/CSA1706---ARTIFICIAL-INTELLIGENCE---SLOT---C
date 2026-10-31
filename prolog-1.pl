sum_n(N, Sum) :-
    integer(N),
    N >= 0,
    sum_n_acc(N, 0, Sum).

sum_n_acc(0, Acc, Acc).

sum_n_acc(N, Acc, Sum) :-
    N > 0,
    NewAcc is Acc + N,
    Next is N - 1,
    sum_n_acc(Next, NewAcc, Sum).
