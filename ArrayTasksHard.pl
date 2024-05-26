% Предикат чтения списка
read_list(List) :-
    write('Введите список в формате [4, 5, 6]: '),
    read(List).

% Дан целочисленный массив. Вывести индексы элементов, которые меньше
% своего левого соседа, и количество таких чисел.
less_than_left_neighbor(List, Indices, Count) :-
    less_than_left_neighbor(List, 1, Indices, 0, Count).

less_than_left_neighbor([_], _, [], Count, Count).
less_than_left_neighbor([X, Y | T], Index, [Index | Indices], Acc, Count) :-
    Y < X, !,
    NextIndex is Index + 1,
    NewAcc is Acc + 1,
    less_than_left_neighbor([Y | T], NextIndex, Indices, NewAcc, Count).
less_than_left_neighbor([_, Y | T], Index, Indices, Acc, Count) :-
    NextIndex is Index + 1,
    less_than_left_neighbor([Y | T], NextIndex, Indices, Acc, Count).

% Предикат вывода для задачи 1
write_indices_and_count(Indices, Count) :-
    write('Индексы: '), write(Indices), nl,
    write('Количество элементов, меньших, чем их левый сосед: '), write(Count), nl.

% Дан целочисленный массив. Необходимо найти количество минимальных
% элементов.
count_min_elements(List, Count) :-
    min_list(List, Min),
    count_occurrences(Min, List, Count).

% Вспомогательный предикат для подсчета вхождений
count_occurrences(_, [], 0).
count_occurrences(X, [X|T], Count) :-
    count_occurrences(X, T, SubCount),
    Count is SubCount + 1.
count_occurrences(X, [_|T], Count) :-
    count_occurrences(X, T, Count).

% Предикат вывода для задачи 2
write_min_elements_count(Count) :-
    write('Количество минимальных элементов: '), write(Count), nl.

% Для введенного списка построить список из элементов, встречающихся в исходном
% более трех раз.
more_than_three_occurrences(List, Result) :-
    findall(X, (member(X, List), count_occurrences(X, List, Count), Count > 3), Temp),
    sort(Temp, Result).

% Предикат вывода для задачи 3
write_more_than_three_occurrences(Result) :-
    write('Элементы, встречающиеся более трех раз: '), write(Result), nl.

% Для введенного списка построить новый список, который получен из начального
% упорядочиванием по количеству встречаемости элемента.
sort_by_occurrences(List, Sorted) :-
    findall(Count-X, (member(X, List), count_occurrences(X, List, Count)), Pairs),
    sort(1, @>=, Pairs, SortedPairs),
    pairs_keys_values(SortedPairs, Counts, Values),
    flatten_counts(Counts, Values, Sorted).

% Вспомогательный предикат для разворачивания списка по количеству элементов
flatten_counts([], [], []).
flatten_counts([Count|Counts], [X|Values], Result) :-
    replicate(Count, X, Replicated),
    flatten_counts(Counts, Values, Rest),
    append(Replicated, Rest, Result).

% Вспомогательный предикат для репликации одного элемента
replicate(0, _, []) :- !.
replicate(Count, X, [X | T]) :-
    NewCount is Count - 1,
    replicate(NewCount, X, T).

% Предикат вывода для задачи 4
write_sorted_by_occurrences(Sorted) :-
    write('Список отсортирован по встречаемости: '), write(Sorted), nl.

% Основной предикат (переименован для предотвращения конфликтов)
run :-
    read_list(List),

    % Задача 1
    less_than_left_neighbor(List, Indices, Count1),
    write_indices_and_count(Indices, Count1),

    % Задача 2
    count_min_elements(List, Count2),
    write_min_elements_count(Count2),

    % Задача 3
    more_than_three_occurrences(List, Result3),
    write_more_than_three_occurrences(Result3),

    % Задача 4
    sort_by_occurrences(List, Sorted),
    write_sorted_by_occurrences(Sorted).

% Запуск основной программы
:- initialization(run, main).
