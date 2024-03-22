%max(+X,+Y,+U,-Z)
max(X, Y, U, Z) :-
    (   X >= Y, X >= Z -> U = X; Y >= X, Y >= Z -> U = Y; Z >= X, Z >= Y -> U = Z).

%Вычисление факториала fact_up(+N,-X) для числа N рекурсией вверх
fact_up(0,1).
fact_up(N, X) :-
    N > 0,
    N1 is N - 1,
    fact_up(N1, X1),
    X is N * X1.

%Вычисление факториала fact_down(+N,-X) для числа N рекурсией вниз
fact_down(N, X) :-
    fact_down_help(N, 1, X).

fact_down_help(0, Acc, Acc).
fact_down_help(N, Acc, X) :-
    N > 0,
    N1 is N - 1,
    Acc1 is Acc * N,
    fact_down_help(N1, Acc1, X).

%Сумма цифр числа с помощью рекурсии вверх sum_digit_up(+Number,-Sum)
sum_digits_up(0, 0).
sum_digits_up(Number, Sum) :-
    Number > 0,
    NextNumber is Number div 10,
    Digit is Number mod 10,
    sum_digits_up(NextNumber, PartSum),
    Sum is PartSum + Digit.

%Сумма цифр числа с помощью рекурсии вниз sum_digits_down(+Number,-Sum)
sum_digits_down(Number, Sum) :- sum_digits_down_help(Number, 0, Sum).

sum_digits_down_help(0, Acc, Acc).
sum_digits_down_help(Number, Acc, Sum) :-
    Number > 0,
    NextNumber is Number div 10,
    Digit is Number mod 10,
    NewAcc is Acc + Digit,
    sum_digits_down_help(NextNumber, NewAcc, Sum).

%Проверить, является ли число свободным от квадратов.
number_free_of_squares(N):-
    \+ (between(2, N, X), X * X =:= N).

%Предикат чтения списка с клавиатуры и предикат вывода списка на экран.
read_list(List):-
    write('Введите список: '),
    read(List),
    List = [_|_].

print_list([]). % Если список пуст
print_list([Head|Tail]):-
    write(Head), write(' '),
    print_list(Tail).

% Реализовать предикат sum_list_up(+List, ?Summ), который проверяет,
% является ли Summ суммой элементов списка или записывает в эту
% переменную сумму элементов. Для построения воспользоваться рекурсией вниз.
sum_list_up([], 0).
sum_list_up([H|T], Summ):-
    sum_list_up(T, TSumm),
    Summ is H + TSumm.

print_sum(Summ):- write(Summ), nl.

% Построить предикат sum_list_down(+List, ?Summ), который проверяет,
% является ли Summ суммой элементов списка или записывает в эту
% переменную сумму элементов. Для построения воспользоваться рекурсией
% вверх.
sum_list_down(List, Summ):-
    sum_list_down_next(List, 0, Summ).

sum_list_down_next([], Sum, Sum).
sum_list_down_next([H|T], CurSum, Sum):-
    NewCurSum is CurSum + H,
    sum_list_down_next(T, NewCurSum, Sum).

% Удаление эл-ов из списка, где сумма чисел равна заданной
rm_elem_as_list(_, [], []). % Если список пуст, то результат тоже "пуст"
rm_elem_as_list(Sum, [H|T], Res):-
    sum_digits_down(H, HSum), % Вычисляем сумму цифр головы списка
    (   HSum == Sum -> rm_elem_as_list(Sum, T, Res)
    ;   Res = [H|R],
        rm_elem_as_list(Sum, T, R)
    ).

main:-
    read_list(List),
    write('Список элементов: '), print_list(List), nl,
    write('Сумма элементов в списке(Рекурсия вниз): '), sum_list_down(List, Summ),
	print(Summ),
    nl.
	
