%Пусть d ( n ) определяется как сумма собственных делителей n (чисел меньше n, которые
%делятся равномерно на n ). Если d ( a ) = b и d ( b ) = a , где a != b , то a и b являются дружественной парой, и каждый
%из a и b называется дружным числом. Например, правильными делителями 220 являются 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 и
% 110; следовательно, d (220) = 284 Правильными делителями 284 являются 1, 2, 4, 71 и
% 142; поэтому d (284) = 220 Найдите количество всех пар дружных чисел до 10000
% Задача должна быть решена без использования списков.
divisor_sum(1, 0) :- !.
divisor_sum(N, Sum) :-
    N > 1,
    findall(Divisor, (between(1, N, Divisor), N mod Divisor =:= 0, Divisor < N), Divisors),
    sum_list(Divisors, Sum).

amicable_pair(A, B) :-
    divisor_sum(A, SumA),
    SumA = B,
    divisor_sum(B, SumB),
    SumB = A,
    A \= B.

find_amicable_pairs(Limit, Count) :-
    findall(A-B, (between(2, Limit, A), amicable_pair(A, B), A < B), Pairs),
    length(Pairs, Count).
