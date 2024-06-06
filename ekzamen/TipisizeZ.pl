% Построить предикат, позволяющий получить подмножество исходного
% множества. Пример sub([1,2], Ans):- Ans = ([], [1], [2], [1,2])
subset(List, Subsets):- help(List, Subsets).
help([], []).
help([H|T], [H|NewT]):- help(T, NewT).
help([_|T], NewT):- help(T, NewT).

% Тепеьр с использованием этого предиката решить задачу компоновки
% рюкзака минимального веса. Дан рюкзак с заданным объемом V. Дан набор
% объектов [[3,4], [5,6], [7,8], [4,5]], где первое число объем объекта,
% второе число вес объекта. Сначала решить задачу нахождения
% подмножества объектов, сумма объемов которых равна объему рюкзака.

% Вычисление общего объема
total_volume([], 0).
total_volume([[V,_]|T], TotalVolume) :- total_volume(T, Rest), TotalVolume is V + Rest.

% Поиска подмножества с заданным объемом
backpack(Items, Volume, Subset) :-
    findall(Sub, (subset(Items, Sub), total_volume(Sub, Volume)), Subsets),
    member(Subset, Subsets).


% Далее найти такое подмножество объектов, сумма объектов которых равна
% объему рюкзака, а сумма весов объекта минимальна возможна.

% Подсчета общего веса списка предметов
total_weight([], 0).
total_weight([[_W,W]|T], TotalWeight) :- total_weight(T, Rest), TotalWeight is W + Rest.

backpack_min_weight(Items, Volume, BestSubset) :-
    findall(Sub, (subset(Items, Sub), total_volume(Sub, Volume)), Subsets),
    min_weight_subset(Subsets, BestSubset).

% Поиск подмножества с минимальным весом
min_weight_subset([S], S).
min_weight_subset([S1,S2|T], Min) :-
    total_weight(S1, W1),
    total_weight(S2, W2),
    (W1 < W2 -> min_weight_subset([S1|T], Min); min_weight_subset([S2|T], Min)).


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Построить предикат, позволяющий получить сочетание по k элементов из
% исходного списка.
% Предикат для получения всех комбинаций по k элементов из списка
comb(0, _, []).
comb(N, [X|T], [X|Comb]):-
    N > 0,
    N1 is N - 1,
    comb(N1, T, Comb).
comb(N, [_|T], Comb):-
    N > 0,
    comb(N, T, Comb).

% Далее построить предикат, позволяющий построить размещение без
% повторений по m элементов.
place(0, _, []).
place(M, List, [H|T]):-
    M > 0,
    select(H, List, Rest),
    M1 is M - 1,
    place(M1, Rest, T).



