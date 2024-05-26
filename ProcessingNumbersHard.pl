%Найти сумму простых делителей числа.
%Найти произведение таких делителей числа, сумма цифр которых меньше, чем сумма
%цифр исходного числа.
% Предикат чтения
read_number(Number) :-
    write('Введите число: '),
    read(Number).

% Предикаты для проверки простого числа
is_prime(2).
is_prime(3).
is_prime(N) :-
    N > 3,
    N mod 2 =\= 0,
    \+ has_factor(N, 3).

has_factor(N, L) :-
    N mod L =:= 0.
has_factor(N, L) :-
    L * L < N,
    L2 is L + 2,
    has_factor(N, L2).

% Предикат для вычисления суммы цифр числа
sum_of_digits(0, 0).
sum_of_digits(N, Sum) :-
    N > 0,
    N1 is N // 10,
    Digit is N mod 10,
    sum_of_digits(N1, Sum1),
    Sum is Sum1 + Digit.

% Предикат для нахождения суммы и произведения простых делителей
filtered_prime_divisors(N, PrimeDivisors) :-
    sum_of_digits(N, SumDigits),
    findall(Divisor,
            (between(2, N, Divisor),
             N mod Divisor =:= 0,
             is_prime(Divisor),
             sum_of_digits(Divisor, SumD),
             SumD < SumDigits),
            PrimeDivisors).

sum_list([], 0).
sum_list([H|T], Sum) :-
    sum_list(T, Sum1),
    Sum is Sum1 + H.

product_list([], 1).
product_list([H|T], Product) :-
    product_list(T, Product1),
    Product is Product1 * H.

% Предикат вывода
write_result(Sum, Product) :-
    write('Сумма простых делителей: '), write(Sum), nl,
    write('Произведение простых делителей: '), write(Product), nl.

% Основной предикат программы
main :-
    read_number(Number),
    filtered_prime_divisors(Number, PrimeDivisors),
    sum_list(PrimeDivisors, SumDivisors),
    product_list(PrimeDivisors, ProductDivisors),
    write_result(SumDivisors, ProductDivisors).
























