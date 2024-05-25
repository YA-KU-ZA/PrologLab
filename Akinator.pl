main :-
    nl, write('Тема - фильмы.'), nl,
    retractall(asked(_,_)), fault(Problem),
   !,
    nl,
    write('Это '), write(Problem), write(.), nl.
main :- write('Я не знаю что это за фильм'), nl.

problem('Драма'):- query('Это драматический фильм?').
problem('Комедия'):- query('Это комедия?').
problem('Фантастика'):- query('Это фильм в жанре фантастика?').
problem('Триллер'):- query('Это триллер?').
problem('США'):- query('Фильм снят в США?').
problem('Россия'):- query('Фильм снят в России?').
problem('Франция'):- query('Фильм снят во Франции?').
problem('До2000'):- query('Фильм выпущен до 2000 года?').
problem('После2000'):- query('Фильм выпущен после 2000 года?').
problem('Оскар'):- query('Фильм получил Оскара?').
problem('Награды'):- query('Фильм получил какие-либо награды?').
problem('Сериал'):- query('Это сериал?').
problem('Фильм'):- query('Это полнометражный фильм?').
problem('Анимация'):- query('Это анимационный фильм?').
problem('Документальный'):- query('Это документальный фильм?').

fault('Титаник'):-
    problem('Драма'),
    problem('США'),
    problem('После2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Интерстеллар'):-
    problem('Фантастика'),
    problem('США'),
    problem('После2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Брат'):-
    problem('Драма'),
    problem('Россия'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Назад в будущее'):-
    problem('Фантастика'),
    problem('США'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Амели'):-
    problem('Комедия'),
    problem('Франция'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Игра престолов'):-
    problem('Триллер'),
    problem('США'),
    problem('После2000'),
    problem('Сериал'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Мадагаскар'):-
    problem('Анимация'),
    problem('США'),
    problem('После2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Марш'):-
    problem('Документальный'),
    problem('США'),
    problem('После2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Гарри Поттер и философский камень'):-
    problem('Фантастика'),
    problem('США'),
    problem('После2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Властелин колец: Братство кольца'):-
    problem('Фантастика'),
    problem('США'),
    problem('После2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Матрица'):-
    problem('Фантастика'),
    problem('США'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Пираты Карибского моря: Проклятие Черной жемчужины'):-
    problem('Фантастика'),
    problem('США'),
    problem('После2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Звездные войны: Эпизод IV - Новая надежда'):-
    problem('Фантастика'),
    problem('США'),
    problem('До2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Трансформеры'):-
    problem('Фантастика'),
    problem('США'),
    problem('После2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Интерны'):-
    problem('Комедия'),
    problem('Россия'),
    problem('После2000'),
    problem('Сериал'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Друзья'):-
    problem('Комедия'),
    problem('США'),
    problem('До2000'),
    problem('Сериал'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Большой куш'):-
    problem('Комедия'),
    problem('США'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Такси'):-
    problem('Комедия'),
    problem('Франция'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Список Шиндлера'):-
    problem('Драма'),
    problem('США'),
    problem('До2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Форрест Гамп'):-
    problem('Драма'),
    problem('США'),
    problem('До2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Терминатор'):-
    problem('Фантастика'),
    problem('США'),
    problem('До2000'),
    problem('Награды'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('Гладиатор'):-
    problem('Драма'),
    problem('США'),
    problem('После2000'),
    problem('Оскар'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

% assert - предикат, который используется для динамического добавления
% фактов в базу знаний во время выполнеения программы.
query(Prompt) :-
    (
        asked(Prompt, Reply) -> true;
        nl, write(Prompt), write(' (y/n)? '), read(X),
        (X = y -> Reply = y; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.
