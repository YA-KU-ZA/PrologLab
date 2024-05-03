%Вариант 1: Беседует трое друзей: Белокуров, Рыжов, Чернов. Брюнет
% сказал Белокурову: “Любопытно, что один из нас блондин, другой брюнет,
% третий - рыжий, но ни у кого цвет волос не соответствует фамилии”.
% Какой цвет волос у каждого из друзей?
logicalTask :-
    Friends = [_,_,_],
    member([belokurov, Color1], Friends),
    member([rizhov, Color2], Friends),
    member([chernov, Color3], Friends),

    member([_,'белый'], Friends),
    member([_,'рыжий'], Friends),
    member([_,'черный'], Friends),

    Color1 \= 'белый',
    Color2 \= 'рыжий',
    Color3 \= 'черный',

    write("Цвет волос Белокурова: "), write(Color1), nl,
    write("Цвет волос Рыжова: "), write(Color2), nl,
    write("Цвет волос Чернова: "), write(Color3), nl.
