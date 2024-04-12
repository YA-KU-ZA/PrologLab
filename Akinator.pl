main :- 
	%retractall используется для удаления уже заданного вопроса 
    retractall(asked(_,_)), 
    fault(Problem), !, nl, 
    write('Это растение '), write(Problem), write(.), nl. 
main :- 
    nl, write('Я такого не знаю.'), nl. 

problem('Цветы'):- 
	query('Это растение относится к цветам?'). 

problem('Полевая'):- 
	query('Этот цветок относится к полевым?'). 

problem('Кустарное'):- 
	query('Это цветок относится к кустарным?'). 

problem('Шипы'):- 
	query('У этого цветка есть шипы на стебле?'). 

problem('Любовь'):- 
	query('По этому цветку гадают на любовь?'). 

problem('Пышный'):- 
	query('У этого цветка пышный бутон?'). 

problem('Победа'):- 
	query('Этот цветок является символом праздника победы?'). 

problem('Сладость'):- 
	query('Этот цветок связан с названием сладости?'). 

problem('Овощи'):- 
	query('Это растение относится к овощам?'). 

problem('Куст'):- 
	query('Этот овощ растет на кусте?'). 

problem('Земля'):- 
	query('Этот овощ растет в земле?'). 

problem('Красный'):- 
	query('Этот овощ красного цвета?'). 

problem('Зеленый'):- 
	query('Этот овощ зеленого цвета?'). 

problem('Оранжевый'):- 
	query('Этот овощ оранжевого цвета?'). 

problem('Горький'):- 
	query('Этот овощ горький на вкус?'). 

problem('Беларусь'):- 
	query('Этот овощ ассоциируется с Белроуссией'). 

problem('Деревья'):- 
	query('Это растение относится к деревьям?'). 

problem('Плод'):- 
	query('Это дерево плодоносит?'). 

problem('Не_плод'):- 
	query('Это дерево не плодоносит?'). 

problem('ЧБ'):- 
	query('У этого дерева кора черно-белая?'). 

problem('Желуди'):- 
	query('У этого дерева есть желуди?'). 

problem('Плакучая'):- 
	query('Это дерево называют плакучим?'). 

problem('Круг'):- 
	query('Фрукт этого дерева круглой формы?'). 

problem('Овал'):- 
	query('Фрукт этого дерева овальной формы?'). 

problem('Ягода'):- 
	query('Это растение относится к ягоды?'). 

problem('Большой_размер'):- 
	query('Эта ягода большого размера?'). 

problem('Маленький_размер'):- 
	query('Эта ягода мальнького размера?'). 

problem('Зеленая_полоска'):- 
	query('У этой ягоды есть полоски темно-зеленого и зеленого цвета?'). 

problem('Желто_оранжевый'):- 
	query('Эта ягода желто-оранжевого цвета?'). 

problem('Растет_на_дереве'):- 
	query('Эта ягода растет на дереве?'). 

problem('Темно-фиолетовая'):- 
	query('Эта ягода темно-фиолетого цвета?'). 

problem('Красная_ягода'):- 
	query('Эта ягода красного цвета с семечками на кожице?'). 

fault('Роза') :- 
	problem('Цветы'), 
	problem('Кустарное'), 
	problem('Шипы'). 

fault('Ромашки') :- 
	problem('Цветы'), 
	problem('Полевая'), 
	problem('Любовь'). 

fault('Пион') :- 
	problem('Цветы'), 
	problem('Кустарное'), 
	problem('Пышный'). 

fault('Гвоздика') :- 
	problem('Цветы'), 
	problem('Полевая'), 
	problem('Победа'). 

fault('Ирис') :- 
	problem('Цветы'), 
	problem('Полевая'), 
	problem('Сладость'). 

fault('Помидор') :- 
	problem('Овощи'), 
	problem('Куст'), 
	problem('Красный'). 

fault('Огурец') :- 
	problem('Овощи'), 
	problem('Куст'), 
	problem('Красный'). 

fault('Морковка') :- 
	problem('Овощи'), 
	problem('Земля'), 
	problem('Оранжевый'). 

fault('Картошка') :- 
	problem('Овощи'), 
	problem('Земля'), 
	problem('Беларусь'). 

fault('Лук') :- 
	problem('Овощи'), 
	problem('Земля'), 
	problem('Горький'). 

fault('Береза') :- 
	problem('Деревья'), 
	problem('Не_плод'), 
	problem('ЧБ'). 

fault('Ива') :- 
	problem('Деревья'), 
	problem('Не_плод'), 
	problem('Плакучая'). 
 
fault('Яблоня') :- 
	problem('Деревья'), 
	problem('Плод'), 
	problem('Круг'). 
 
fault('Груша') :- 
	problem('Деревья'), 
	problem('Плод'), 
	problem('Овал'). 

fault('Дуб') :- 
	problem('Деревья'), 
	problem('Не_плод'), 
	problem('Желуди'). 

fault('Арбуз') :- 
	problem('Ягода'), 
	problem('Большой_размер'), 
	problem('Зеленая_полоска'). 

fault('Дыня') :- 
	problem('Ягода'), 
	problem('Большой_размер'), 
	problem('Желто_оранжевый'). 

fault('Клубника') :- 
	problem('Ягода'), 
	problem('Маленький_размер'), 
	problem('Красная_ягода'). 

fault('Черешня') :- 
	problem('Ягода'), 
	problem('Маленький_размер'), 
	problem('Растет_на_дереве'). 

fault('Ежевика') :- 
	problem('Ягода'), 
	problem('Маленький_размер'), 
	problem('Темно-фиолетовая'). 
 
query(Prompt) :- 
    (   asked(Prompt, Reply) -> true 
    ;   nl, write(Prompt), write(' (y/n)? '), 
	read(X),(X = y -> Reply = y ; Reply = n), 
	assert(asked(Prompt, Reply)) 
    ), 
    Reply = y. 
