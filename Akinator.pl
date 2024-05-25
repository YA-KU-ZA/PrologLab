main :-
    nl, write('���� - ������.'), nl,
    retractall(asked(_,_)), fault(Problem),
   !,
    nl,
    write('��� '), write(Problem), write(.), nl.
main :- write('� �� ���� ��� ��� �� �����'), nl.

problem('�����'):- query('��� ������������� �����?').
problem('�������'):- query('��� �������?').
problem('����������'):- query('��� ����� � ����� ����������?').
problem('�������'):- query('��� �������?').
problem('���'):- query('����� ���� � ���?').
problem('������'):- query('����� ���� � ������?').
problem('�������'):- query('����� ���� �� �������?').
problem('��2000'):- query('����� ������� �� 2000 ����?').
problem('�����2000'):- query('����� ������� ����� 2000 ����?').
problem('�����'):- query('����� ������� ������?').
problem('�������'):- query('����� ������� �����-���� �������?').
problem('������'):- query('��� ������?').
problem('�����'):- query('��� �������������� �����?').
problem('��������'):- query('��� ������������ �����?').
problem('��������������'):- query('��� �������������� �����?').

fault('�������'):-
    problem('�����'),
    problem('���'),
    problem('�����2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������������'):-
    problem('����������'),
    problem('���'),
    problem('�����2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����'):-
    problem('�����'),
    problem('������'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����� � �������'):-
    problem('����������'),
    problem('���'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('�����'):-
    problem('�������'),
    problem('�������'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('���� ���������'):-
    problem('�������'),
    problem('���'),
    problem('�����2000'),
    problem('������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����������'):-
    problem('��������'),
    problem('���'),
    problem('�����2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����'):-
    problem('��������������'),
    problem('���'),
    problem('�����2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����� ������ � ����������� ������'):-
    problem('����������'),
    problem('���'),
    problem('�����2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('��������� �����: �������� ������'):-
    problem('����������'),
    problem('���'),
    problem('�����2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('�������'):-
    problem('����������'),
    problem('���'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������ ���������� ����: ��������� ������ ���������'):-
    problem('����������'),
    problem('���'),
    problem('�����2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('�������� �����: ������ IV - ����� �������'):-
    problem('����������'),
    problem('���'),
    problem('��2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������������'):-
    problem('����������'),
    problem('���'),
    problem('�����2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('�������'):-
    problem('�������'),
    problem('������'),
    problem('�����2000'),
    problem('������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������'):-
    problem('�������'),
    problem('���'),
    problem('��2000'),
    problem('������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������� ���'):-
    problem('�������'),
    problem('���'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('�����'):-
    problem('�������'),
    problem('�������'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������ ��������'):-
    problem('�����'),
    problem('���'),
    problem('��2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('������� ����'):-
    problem('�����'),
    problem('���'),
    problem('��2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('����������'):-
    problem('����������'),
    problem('���'),
    problem('��2000'),
    problem('�������'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

fault('���������'):-
    problem('�����'),
    problem('���'),
    problem('�����2000'),
    problem('�����'),
    bagof(X, asked(X, y), L),
    length(L, A),
    A = 4,!.

% assert - ��������, ������� ������������ ��� ������������� ����������
% ������ � ���� ������ �� ����� ����������� ���������.
query(Prompt) :-
    (
        asked(Prompt, Reply) -> true;
        nl, write(Prompt), write(' (y/n)? '), read(X),
        (X = y -> Reply = y; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.