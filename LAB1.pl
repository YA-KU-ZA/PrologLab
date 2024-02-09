man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(alan).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).
woman(veronica).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).
parent(voeneg,alan).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).
parent(goluba,alan).

parent(ratibor,bogomil).
parent(ratibor,veronica).
parent(bratislava,bogomil).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).


men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.
children(X):- parent(X,Y), print(Y), nl, fail.

%Задание 1:
% Построить предикат mother(+X, ?Y), который проверяет, является ли X
% матерью Y.Построить предикат, mother(+X), который выводит маму X.
mother(X,Y):- woman(X), parent(X,Y).
mother(X):- mother(Y,X), print(Y), nl, fail.
% Построить предикат brother(+X, ?Y), который проверяет, является ли X
% братом Y. Построить предикат brothers(+X), который выводит всех
% братьев X.
brother(X,Y):- man(X), man(K), parent(K, X), parent(K, Y), X\=Y.
brothers(X):- brother(Y,X), print(Y), nl, fail.
% Построить предикат b_s(+X,?Y), который проверяет, являются ли X и Y
% родными братом и сестрой или братьями или сестрами. Построить предикат
% b_s(+X), который выводит всех братьев или сестер X.
b_s(X,Y):- man(K), parent(K, X), parent(K, Y), X\=Y.
b_s(X):- b_s(Y,X), print(Y), nl, fail.
