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

%НОД двух чисел (+Num1,+Num2,-Del)
nod_digits(Num1, Num2, Del):-
    (   Num1 =< Num2 -> nod_digits_help(Num1, Num2, Del);
    nod_digits_help(Num2, Num1, Del)).

nod_digits_help(Num1, Num2, Del):-
    (   Num2 =:= 0 -> Del = Num1;
    NewNum2 is Num1 mod Num2, nod_digits_help(Num2, NewNum2, Del)).
