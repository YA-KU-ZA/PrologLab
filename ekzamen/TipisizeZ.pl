% ��������� ��������, ����������� �������� ������������ ���������
% ���������. ������ sub([1,2], Ans):- Ans = ([], [1], [2], [1,2])
subset(List, Subsets):- help(List, Subsets).
help([], []).
help([H|T], [H|NewT]):- help(T, NewT).
help([_|T], NewT):- help(T, NewT).

% ������ � �������������� ����� ��������� ������ ������ ����������
% ������� ������������ ����. ��� ������ � �������� ������� V. ��� �����
% �������� [[3,4], [5,6], [7,8], [4,5]], ��� ������ ����� ����� �������,
% ������ ����� ��� �������. ������� ������ ������ ����������
% ������������ ��������, ����� ������� ������� ����� ������ �������.

% ���������� ������ ������
total_volume([], 0).
total_volume([[V,_]|T], TotalVolume) :- total_volume(T, Rest), TotalVolume is V + Rest.

% ������ ������������ � �������� �������
backpack(Items, Volume, Subset) :-
    findall(Sub, (subset(Items, Sub), total_volume(Sub, Volume)), Subsets),
    member(Subset, Subsets).


% ����� ����� ����� ������������ ��������, ����� �������� ������� �����
% ������ �������, � ����� ����� ������� ���������� ��������.

% �������� ������ ���� ������ ���������
total_weight([], 0).
total_weight([[_W,W]|T], TotalWeight) :- total_weight(T, Rest), TotalWeight is W + Rest.

backpack_min_weight(Items, Volume, BestSubset) :-
    findall(Sub, (subset(Items, Sub), total_volume(Sub, Volume)), Subsets),
    min_weight_subset(Subsets, BestSubset).

% ����� ������������ � ����������� �����
min_weight_subset([S], S).
min_weight_subset([S1,S2|T], Min) :-
    total_weight(S1, W1),
    total_weight(S2, W2),
    (W1 < W2 -> min_weight_subset([S1|T], Min); min_weight_subset([S2|T], Min)).


% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% ��������� ��������, ����������� �������� ��������� �� k ��������� ��
% ��������� ������.
% �������� ��� ��������� ���� ���������� �� k ��������� �� ������
comb(0, _, []).
comb(N, [X|T], [X|Comb]):-
    N > 0,
    N1 is N - 1,
    comb(N1, T, Comb).
comb(N, [_|T], Comb):-
    N > 0,
    comb(N, T, Comb).

% ����� ��������� ��������, ����������� ��������� ���������� ���
% ���������� �� m ���������.
place(0, _, []).
place(M, List, [H|T]):-
    M > 0,
    select(H, List, Rest),
    M1 is M - 1,
    place(M1, Rest, T).



