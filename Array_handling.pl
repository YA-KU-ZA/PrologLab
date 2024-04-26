max_element([Head], Head).

%Cравниваем голову списка с максимальным элементом из хвоста списка.
max_element([Head|Tail], Max) :-
    max_element(Tail, MaxTail),
    Max is max(Head, MaxTail).

%Дан целочисленный массив. Необходимо найти количество элементов,
%расположенных после последнего максимального. count_after_max(+List,-Count)
count_after_max(List, Count):-
    max_element(List, Max),
    help_count(List, Max, 0, Count).
help_count([], _, Cou, Cou).
help_count([H|T], Max, CurCou, Ans):-
    (   H \= Max -> NewCurCou is CurCou + 1, help_count(T, Max, NewCurCou, Ans)
    ;   NewCurCou = 0, help_count(T, Max, NewCurCou, Ans)).

% Дан целочисленный массив. Необходимо найти два наибольших элемента.
% two_max(+list,- ans)
two_max([H|T], Ans):-
    help_max2([H|T], H, H, Ans).

help_max2([], Max1, Max2, Max):-Max = [Max1, Max2].
help_max2([H|T], CurMax1, CurMax2, Ans):-
    H > CurMax2 -> NewCurMax2 is H, NewCurMax1 is CurMax2, help_max2(T, NewCurMax1, NewCurMax2, Ans); help_max2(T, CurMax1, CurMax2, Ans).


% Дан целочисленный массив и натуральный индекс (число, меньшее размера
% массива). Необходимо определить является ли элемент по указанному
% индексу локальным максимумом.

read_list(0, []):- !.
read_list(N, [H|T]):- read(H), NewN is N - 1, read_list(NewN, T).

print_list([]):- !.
print_list([H|T]):- write(' '), write(H), print_list(T).

main_main(N, Ans):-
    read_list(N, List),
    write("Введите индекс элемента, который надо проверить: "), read(Index),
    local_maximum(List, Index, Ans).


% Предикат local_maximum(+List,+Index,-Result) проверяет, является ли элемент массива по указанному индексу локальным максимумом.

local_maximum(List, Index, Result) :-
    % Проверяем, что индекс находится в пределах списка
    length(List, Length),
    Index >= 0,
    Index < Length,

    % Извлекаем элемент по индексу
    nth0(Index, List, Element),

    % Проверяем, что элемент больше всех элементов слева и справа от него
    (Index = 0 ->
        % Если элемент находится в начале списка, проверяем, что он больше элемента справа
        Index1 is Index + 1,
        nth0(Index1, List, NextElement),
        Element > NextElement
    ; Index = Length - 1 ->
        % Если элемент находится в конце списка, проверяем, что он больше элемента слева
        Index0 is Index - 1,
        nth0(Index0, List, PrevElement),
        Element > PrevElement
    ;
        % Если элемент находится в середине списка, проверяем, что он больше элемента слева и справа
        Index0 is Index - 1,
        Index1 is Index + 1,
        nth0(Index0, List, PrevElement),
        nth0(Index1, List, NextElement),
        Element > PrevElement,
        Element > NextElement
    ),

    % Если все условия выполнены, результат проверки - true
    Result = true, !.

local_maximum(_, _, false).


























































