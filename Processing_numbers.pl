%Произведение цифр числа рекурсией вниз (+Number, -Comp)
comp_digits_down(Number, Comp) :- comp_digits_down_help(Number, 1, Comp).

comp_digits_down_help(0, Acc, Acc).
comp_digits_down_help(Number, Acc, Comp) :-
    Number > 0,
    NextNumber is Number div 10,
    Digit is Number mod 10,
    NewAcc is Acc * Digit,
    comp_digits_down_help(NextNumber, NewAcc, Comp).

%Произведение цифр числа рекурсией вверх (+Number,-Comp)
comp_digits_up(0, 1).
comp_digits_up(Number, Comp) :-
    Number > 0,
    NextNumber is Number div 10,
    Digit is Number mod 10,
    comp_digits_up(NextNumber, PartComp),
    Comp is PartComp * Digit.

%Найти кол-во нечетных цифр числа больших 3 рекурсия вниз(+Number, -Counter)
found_digits_down(Number, Counter):-
    found_digits_down_help(Number, 0, Counter).

found_digits_down_help(0, Cou, Cou):- !.
found_digits_down_help(Number, CurCounter, AllCounter):-
    Number1 is Number mod 10,
    (   Number1 > 3, Number1 mod 2 =:= 1 -> Number2 is Number // 10, NewCurCounter is CurCounter + 1, found_digits_down_help(Number2, NewCurCounter, AllCounter)
    ;   Number2 is Number // 10, found_digits_down_help(Number2, CurCounter, AllCounter)).

%Найти кол-во нечетных цифр числа больших 3 рекурсия вверх(+Number, -Counter)
found_digits_up(0, 0):-!.
found_digits_up(N, Count):-
    N > 0, N1 is N mod 10,
    ( N1 > 3, N1 mod 2 =:= 1 -> N2 is N // 10, found_digits_up(N2, Count1), Count is Count1 + 1;
	N2 is N // 10, found_digits_up(N2, Count)).

% Предикат для вычисления НОД рекурсией вверх nod_up(+X,+Y,-NOD).
nod_up(0, Y, Y) :- Y > 0.
nod_up(X, 0, X) :- X > 0.
nod_up(X, Y, NOD) :-
    X > Y, X1 is X mod Y,
    nod_up(X1, Y, NOD).
nod_up(X, Y, NOD) :-
    Y > X, Y1 is Y mod X,
    nod_up(X, Y1, NOD).
	
% Предикат для вычисления НОД рекурсией вниз nod_down(+X,+Y,-NOD).
nod_down(X, 0, X) :- X > 0.
nod_down(X, Y, NOD) :-
    Y > 0,
    Z is X mod Y,
    nod_down(Y, Z, NOD).