fun main() {
    //Решить задачи с применением чистых функций и возможностей коллекций Java, так
    // и для Котлин(без использования циклов и foreach).
    //Реализовать функцию, которая для данного списка указывает, сколько элементов из
    //него могут быть квадратом какого-то из элементов списка. Реализовать функцию, которая по трем спискам составляет список,
    //состоящий из кортежей длины 3, где каждый кортеж (ai,bi,ci) с номером I получен следующим образом:
    //Ai – I по убыванию элемент первого списка
    //Bi – I по возрастанию суммы цифр элемент второго списка
    //Сi - I по убыванию количества делителей элемент третьего списка
    //Все элементы одного списка различны.
    //Если в списках B или C два элемента имеют одинаковый коэффициент, большим считается элемент, больший по абсолютной величине.
    val list = listOf(1, 2, 3, 4, 9, 16, 25)
    val count = countSqElem(list)
    println("Количество элементов, которые могут быть квадратами других элементов: $count")

    val listA = listOf(1, 2, 3, 4, 5)
    val listB = listOf(12, 45, 78, 23, 56)
    val listC = listOf(6, 28, 12, 18, 20)

    val triples = createTripleList(listA, listB, listC)
    triples.forEach(::println)
}

fun countSqElem(list: List<Int>): Long {
    val squares = list.map { it * it }.toSet()
    return list.count { it in squares }.toLong()
}

fun createTripleList(listA: List<Int>, listB: List<Int>, listC: List<Int>): List<Triple<Int, Int, Int>> {
    val sortedA = listA.sortedDescending()
    val sortedB = listB.sortedBy { it.sumDigits() }
    val sortedC = listC.sortedWith(compareByDescending<Int> { it.countDivis() }
        .thenByDescending { Math.abs(it) })

    return sortedA.zip(sortedB).zip(sortedC).map { Triple(it.first.first, it.first.second, it.second) }
}

fun Int.sumDigits(): Int {
    return this.toString().map { it.toString().toInt() }.sum()
}

fun Int.countDivis(): Int {
    return (1..Math.abs(this)).count { Math.abs(this) % it == 0 }
}