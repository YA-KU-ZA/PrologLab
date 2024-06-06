write_lines(Lines):-
     open("c:/Users/strel/OneDrive/Рабочий стол/prolog labs/file.txt", write, Stream, [encoding(utf8)]),
     maplist(write_line(Stream), Lines),
     close(Stream).
write_line(Stream, Line):- write(Stream, Line), nl(Stream).

% Предикат read_file(+FileName, -Lines)
% c:/Users/strel/OneDrive/Рабочий стол/prolog labs/file.txt
read_file(Lines) :-
    open("c:/Users/strel/OneDrive/Рабочий стол/prolog labs/file.txt", read, Stream, [encoding(utf8)]),
    read_lines(Stream, [], Lines),
    close(Stream).
read_lines(Stream, Acc, Lines) :-
    at_end_of_stream(Stream),!,
    reverse(Acc, Lines).
read_lines(Stream, Acc, Lines) :-
    \+ at_end_of_stream(Stream),
    read_line_to_string(Stream, Line),
    read_lines(Stream, [Line|Acc], Lines).
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Дан файл. Прочитать из файла строки и вывести длину наибольшей строки.
find_longest_line(Lines, Answer):-
    read_file(Lines),
    findall(Length, (member(Line, Lines), atom_length(Line, Length)), Lengths),
    max_list(Lengths, Answer).

% Дан файл. Определить, сколько в файле строк, не содержащих пробелы.
count_lines(Lines, Answer):-
    read_file(Lines),
    count_lines_help(Lines, 0, Answer).

count_lines_help([], Count, Count).
count_lines_help([H|T], Acc, Count):-
    split_string(H, ' ', '', Parts),
    length(Parts, PartCount),
    (   PartCount =:= 1 -> NewAcc is Acc + 1; NewAcc = Acc),
    count_lines_help(T, NewAcc, Count).

% Дан файл, найти и вывести на экран только те строки, в которых букв А
% больше, чем в среднем на строку.
count_a_in_line(String, Count):-
    atom_chars(String, Chars),
    findall(X, (member(X, Chars), X = 'А'), AllAs),
    length(AllAs, Count).
average_a(Lines, Average):-
    maplist(count_a_in_line, Lines, Counts),
    sum_list(Counts, TotalCount),
    length(Lines, LineCount),
    Average is TotalCount / LineCount.
filter_lines(Lines, Flines):-
    read_file(Lines),
    average_a(Lines, Average),
    findall(Line, (member(Line, Lines), count_a_in_line(Line, Count), Count > Average), Flines).

% Дан файл, вывести самое частое слово.
