%� ����� ����� ����� �� �������, ����������, ��������, ���������,
%����������� � ������������ ����� ���� ��� ������� � �������, �������� � �������.
%������ �� ��� ���������� ��� ��������. ������� � ������� ������������ ����� � ������
%�� ����. ������� �������� ������ ������� ����������. ������� � ����� �������. �
%����������� ������ ���� �� ���������� � ��������, � ������� � � ������� ������������
%�����. � ����������� �������, ��������� � ������� ����������� ���� ���� �� �������.
%����� �������� ��������� ������ �������?
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

pr_teachers:-

    Teachers = [[moroz,_,_,_],[vasiliev,_,_,_],[tokarev,_,_,_]],

    in_list(Teachers,[moroz,_,_,_]),
    in_list(Teachers,[vasiliev,_,_,_]),
    in_list(Teachers,[tokarev,_,_,_]),

    in_list(Teachers,[_,_,history,_]),
    in_list(Teachers,[_,_,math,_]),
    in_list(Teachers,[_,_,engl,_]),

    in_list(Teachers,[_,_,_,biolog]),
    in_list(Teachers,[_,_,_,geogr]),
    in_list(Teachers,[_,_,_,france]),

    not(in_list(Teachers,[_,_,Lesson,Lesson])),

    %������� � ������� ������������ ����� � ������ �� ����
    in_list(Teachers,[Name1,_,_,france]),
    in_list(Teachers,[Name2,_,_,geogr]),
    \+(Name1 == Name2),

    %������� � ����� �������
    in_list(Teachers,[moroz,1,_,_]),
    in_list(Teachers,[_,2,_,_]),
    in_list(Teachers,[_,3,_,_]),

    %� ����������� ������ ���� �� ���������� � ��������,
    %� ������� � � ������� ������������ �����
    not(in_list(Teachers,[tokarev,_,_,france])),
    not(in_list(Teachers,[tokarev,_,_,biolog])),

    % � ����������� �������, ��������� � ������� ����������� ���� ���� �� �������
    not(in_list(Teachers,[moroz,_,math,_])),
    not(in_list(Teachers,[moroz,_,engl,_])),

    %������� �������� ������ ������� ����������
    in_list(Teachers,[vasiliev,2,_,_]),
    not(in_list(Teachers,[_,1,_,biolog])),
    not(in_list(Teachers,[_,_,math,biolog])),

    %����� ������
    in_list(Teachers,[moroz,_,Les1,Less1]),
    in_list(Teachers,[vasiliev,_,Les2,Less2]),
    in_list(Teachers,[tokarev,_,Les3,Less3]),
    write("moroz:"),write(Les1),write(" "), write(Less1),nl,
    write("vasiliev:"),write(Les2),write(" "), write(Less2),nl,
    write("tokarev:"),write(Les3),write(" "), write(Less3),nl, !.
