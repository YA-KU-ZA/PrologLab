%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Найти произведение цифр числа
mult_up(0, 1).
mult_up(Number, Ans):-
    Number > 0,
    Number1 is Number mod 10,
    Number2 is Number // 10,
    mult_up(Number2, Ans1),
    Ans is Ans1 * Number1.

mult_down(N, Ans):-
    mult_down_help(N, 1, Ans).
mult_down_help(0, Anss, Anss).
mult_down_help(N, CurAns, AllAns):-
    N > 0,
    N1 is N mod 10,
    N2 is N // 10,
    NewCurAns is CurAns * N1,
    mult_down_help(N2, NewCurAns, AllAns).
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~Найти кол-во нечетных цифр числа больших 3
pred(Number, Counter):-
    pred_help(Number, 0, Counter).

pred_help(0, Cou, Cou):- !.
pred_help(Number, CurCounter, AllCounter):-
    Number1 is Number mod 10,
    (   Number1 > 3, Number1 mod 2 =:= 1 -> Number2 is Number // 10, NewCurCounter is CurCounter + 1, pred_help(Number2, NewCurCounter, AllCounter)
    ;   Number2 is Number // 10, pred_help(Number2, CurCounter, AllCounter)).

pred2(0, Count):- print(Count), !.
pred2(N, Count):-
    N > 0, N1 is N mod 10,
    (   N1 > 3, N1 mod 2 =:= 1 -> N2 is N // 10, Count1 is Count + 1, pred2(N2, Count1)
    ;   N2 is N // 10, pred2(N2, Count)).
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Найти НОД двух делителей
nod(Num1, Num2, Del):-
    (   Num1 =< Num2 -> nod_help(Num1, Num2, Del);
    nod_help(Num2, Num1, Del)).

nod_help(Num1, Num2, Del):-
    (   Num2 =:= 0 -> Del = Num1;
    NewNum2 is Num1 mod Num2, nod_help(Num2, NewNum2, Del)).
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



%~~~~~~~~~~~~~~~~~~~~~~Найти максимальную цифру числа, не делящуюся на 3
max_three(0, 0):- !.
max_three(Number, MaxDigit):-
    Number > 0,
    Number1 is Number mod 10,
    (
        Number1 mod 3 =:= 0 -> Number2 is Number // 10, max_three(Number2, MaxDigit)
    ;
        Number2 is Number // 10, max_three(Number2, NewMaxDigit), MaxDigit is max(NewMaxDigit, Number1)
    ).





max_three2(Number, MaxDigit):-
    max_three_help(Number, 0, MaxDigit).

max_three_help(0, Digit, Digit):- !.
max_three_help(Num, CurDig, MaxDig):-
    Num > 0,
    Num1 is Num mod 10,
    (   Num1 mod 3 =:= 0 -> Num2 is Num // 10, max_three_help(Num2, CurDig, MaxDig);
        NewCurDig is max(CurDig, Num1), Num2 is Num // 10, max_three_help(Num2, NewCurDig, MaxDig)
    ).
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


%~Найти кол-во делителей числа~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
coudel(Number, Count):-
    coudel_help(Number, Number, 0, Count).
% Число, Делитель, Текущее кол-во, Итог

coudel_help(_, 0, Cou, Cou):- !.
coudel_help(N, CurDel, CurCou, Ans):-
    (   N mod CurDel =:= 0 -> NewCurCou is CurCou + 1, NewCurDel is CurDel - 1, coudel_help(N, NewCurDel, NewCurCou, Ans)
    ;   NewCurDel is CurDel - 1, coudel_help(N, NewCurDel, CurCou, Ans)
    ).

coudel2(_, 0, 0):- !.
coudel2(N, CurDel, Ans):-
    (   N mod CurDel =:= 0 -> NewCurDel is CurDel - 1, coudel2(N, NewCurDel, Ans1), Ans is Ans1 + 1
    ;   NewCurDel is CurDel - 1, coudel2(N, NewCurDel, Ans)
    ).




% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
read_list(0, []):- !.
read_list(N, [H|T]):- read(H), NewN is N - 1, read_list(NewN, T).

main(N, Answer):-
    read_list(N, List), nl,
    write("Введенный список: "),print_list(List), nl,
    % write("Кол-во элементов после последнего максимального: "), count_after_max(List, Answer), nl,
    write("Индекс минимального элемента: "), find_index_min_elem(List, Answer).

print_list([]):- !.
print_list([H|T]):- write(' '), write(H), print_list(T).

% Поиск максимального
my_max(List, Max):-
    my_max_help(List, 0, Max).
my_max_help([], Max, Max).
my_max_help([H|T], CurMax, Max):-
    (   CurMax < H -> NewCurMax is H, my_max_help(T, NewCurMax, Max)
    ;   my_max_help(T, CurMax, Max)
    ).

% Поиск минимального
my_min([H|T], Min):-
    my_min_help([H|T], H, Min).
my_min_help([], Min, Min).
my_min_help([H|T], CurMin, Min):-
    (   CurMin > H -> NewCurMin is H, my_min_help(T, NewCurMin, Min)
    ;   my_min_help(T, CurMin, Min)).

% Дан целочисленный массив. Необходимо найти количество элементов,
% расположенных после последнего максимального.
count_after_max(List, Count):-
    my_max(List, Max),
    help_count(List, Max, 0, Count).
help_count([], _, Cou, Cou).
help_count([H|T], Max, CurCou, Ans):-
    (   H \= Max -> NewCurCou is CurCou + 1, help_count(T, Max, NewCurCou, Ans)
    ;   NewCurCou = 0, help_count(T, Max, NewCurCou, Ans)).

% Дан целочисленный массив. Необходимо найти индекс минимального
% элемента.
find_index_min_elem(List, Index):-
    my_min(List, Min),
    find_index_min_elem_help(List, Min, 1, Index).
find_index_min_elem_help([], _, Ind, Ind).
find_index_min_elem_help([H|T], Min, CurIndex, Index):-
    (   H \= Min -> NewCurIndex is CurIndex + 1, find_index_min_elem_help(T, Min, NewCurIndex, Index)
    ;   NewCurIndex is CurIndex, find_index_min_elem_help([], Min, NewCurIndex, Index)).

% Дан целочисленный массив и натуральный индекс (число, меньшее размера
% массива). Необходимо определить является ли элемент по указанному
% индексу глобальным максимумом.
find_index_elem(List, Index, Ans):-
    find_index_help(List, Index, 1, Ans),
    (   my_max(List, Ans) -> print(true)).
find_index_help([], _, Index, Index).
find_index_help([H|T], N, CurIndex, Index):-
    (   CurIndex \= N -> NewCurIndex is CurIndex + 1, find_index_help(T, N, NewCurIndex, Index)
    ;   NewCurIndex is H, find_index_help([], N, NewCurIndex, Index)).



loc_max(List, Count):-
    append_zeros(List, [H|T]),
    lmh([H|T], H - 1, 0, Count).

append_zeros(List, NewList):- append(List, [0, 0], NewList).

lmh([0], _, Cou, Cou):- !.
lmh([H|T], Pred, CurCou, Ans):-
    T \= [] -> T = [Next|_],
    ( T == [0, 0], abs(H, NewH),NewNext is Next - NewH - 1, H > Pred, H > NewNext, NewCurCou is CurCou + 1, lmh(T, Pred, NewCurCou, Ans), !
    ; H > Next, H > Pred -> NewPred = H, NewCurCou is CurCou + 1, lmh(T, NewPred, NewCurCou, Ans)
    ; NewPred = H, lmh(T, NewPred, CurCou, Ans)).





% 5 задание 2-го варианта
% Найти количество четных чисел, не взаимно простых с данным

write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

main_1(N, Answer):-
    read_list(N, List), nl,
    write('Введите число, с которым нужно сравнить: '), read(Number),
    chet_not_prost(List, Number, Answer), nl,
    write_list(List).

chet_not_prost(List, Number, Count):-
    chet_not_prost_help(List, Number, 0, Count).
chet_not_prost_help([], _, Cou, Cou).
chet_not_prost_help([H|T], N, CurCou, Cou):-
    H mod 2 =:= 0,
    nod(H, N, Del), Del \= 1 -> NewCurCou is CurCou + 1, chet_not_prost_help(T, N, NewCurCou, Cou);
    chet_not_prost_help(T, N, CurCou, Cou).



% Найти произведение максимального числа, не взаимно простого с данным,
% не делящегося на наименьший делитель исходно числа, и суммы цифр
% числа, меньших 5.

summa_digits(0, 0):- !.
summa_digits(Number, Summa):-
    Number > 0,
    Number1 is Number mod 10,
    (   Number1 < 5 -> Number2 is Number // 10, summa_digits(Number2, Summa1), Summa is Summa1 + Number1; Number2 is Number //10, summa_digits(Number2, Summa)).


no_prost_no_del_on_min(List, Number, Multiplic):-
    my_max(List, Max),
    summa_digits(Max, Summa),
    nod(Max, Number, Del), Del \= 1,
    Multiplic is Max * Summa.



%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
is_prime(N):- N > 1, \+ has_factor(N, 2).

has_factor(N, D):- N mod D =:= 0.

generate_polynomial(A, B, N, Polynomial):- Polynomial is A * N + B.

count_primes(A, B, Count):- count_primes_helper(A, B, 0, 39, 0, Count).

count_primes_helper(_, _, N, MaxN, Count, Count):- N > MaxN.
count_primes_helper(A, B, N, MaxN, Acc, Count):-
    N =< MaxN,
    generate_polynomial(A, B, N, Polynomial),
    (   Polynomial > 0, is_prime(Polynomial) -> NewAcc is Acc + 1 ; NewAcc = Acc),
    NextN is N + 1,
    count_primes_helper(A, B, NextN, MaxN, NewAcc, Count).

solve_task :-
    findall(Count-A-B, (between(0, 999, A), between(0, 999, B), count_primes(A, B, Count)), Results), max_member(Count-A-B, Results),
    write('Коэффициенты: '), write(A), write(' * '), write(B), nl,
    write('Произведение коэффициентов: '), write(A * B), nl.

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Дан целочисленный массив. Необходимо найти минимальный четный элемент.

min_chet_elem(List, Min):-
    filter(List, ChetList),
    my_min(ChetList, Min), !.

% Новый список, состоящий только из четных элементов
filter([], []).
filter([Head|Tail], [Head|NewTail]) :-
    Head mod 2 =:= 0,
    filter(Tail, NewTail).

filter([Head|Tail], NewTail) :-
    Head mod 2 =:= 1,
    filter(Tail, NewTail).

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Дан массив чисел. Необходимо проверить, чередуются ли в нем целые и
% вещественные числа.
check_int_float([]).
check_int_float([H|T]):-
    (   integer(H) -> (T = [H2|T2], float(H2), check_int_float(T2); T = [], check_int_float(T))
    ;   float(H) -> (T = [H2|T2], integer(H2), check_int_float(T2); T = [], check_int_float(T))
    ).


% Для введенного списка построить два списка L1 и L2, где элементы L1 это
% неповторяющиеся элементы исходного списка, а элемент списка L2 с
% номером i показывает,
% сколько раз элемент списка L1 с таким номером повторяется в исходном.

nnn([], []).
nnn([H|T], [H|NewT]):-
    \+ member(H, T), nnn(T, NewT).

nnn([H|T], NewT):-
    member(H, T),
    nnn(T, NewT).



% Жека
% Дан целочисленный массив и натуральный индекс (число, меньшее размера
% массива). Необходимо определить является ли элемент по указанному
% индексу локальным максимумом.

% find_loc_max(+List, -Ans)
find_loc_max([H|T], Ans):-
    helpach(T, H, _, Ans).

helpach([], _, Ans, Ans).
helpach([H|T], Pred, CurMax, Ans):-
    (   T = [H1|_], H > Pred, H > H1 -> NewCurMax is H, NewPred is H, helpach(T, NewPred, NewCurMax, Ans)
    ;   NewPred is H, helpach(T, NewPred, CurMax, Ans)).

% help_ind_loc_max(+List, +Ind, +Max)
help_ind_loc_max([H|T], Ind, Max):-
    Ind \= 0 -> NewInd is Ind - 1, help_ind_loc_max(T, NewInd, Max);
    H is Max.

% Вот это твой предикат логики ind_loc_max(+N, +Ind).
% N - количество элементов, которое будет в списке (пример:
% ind_loc_max(7, _)).
%
% Ind - индекс элемента, который ты хочешь проверить (пример:
% ind_loc_max(7, 4)).
%
% Индекс считается следующим образом: 0, 1, 2...
%
% После ввода N и Ind, вызовется предикат ввода списка, вводишь
% следующим образом: 5. после будет новая строка и вводишь опять число -
% 3. и тд пока не будет введено кол-во = N
ind_loc_max(N, Ind):-
    read_list(N, List),
    write("Локальный максимум в списке: "), find_loc_max(List, Max), print(Max), nl,
    help_ind_loc_max(List, Ind, Max),
    write("Список: "), print_list(List), nl,
    write("Ответ: ").









