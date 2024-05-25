fun main() {
    val array1 = listOf(4, 2, 3, 1, 5, 0, 2)
    val array2 = listOf(4, 2, 3, 1, 5, 1, 2)
    val array3 = listOf(5, 6, 2, 2, 3, 3, 3, 5, 5, 5)

    // Задача 1: Индексы элементов, которые меньше своего левого соседа, и количество таких чисел
    val indAndCount = indAndCount(array1)
    println("Индексы элементов, которые меньше своего левого соседа: ${indAndCount.first}")
    println("Количество таких элементов: ${indAndCount.second}")

    // Задача 2: Количество минимальных элементов
    val countMinElem = countMinElem(array2)
    println("Количество минимальных элементов: $countMinElem")

    // Задача 3: Элементы, встречающиеся более трех раз
    val elemThanThree = elemThanThree(array3)
    println("Элементы, встречающиеся более трех раз: $elemThanThree")

    // Задача 4: Список, упорядоченный по частоте встречаемости элементов
    val sortFreq = sortFreq(array3)
    println("Список, упорядоченный по частоте встречаемости элементов: $sortFreq")
}

fun indAndCount(array: List<Int>): Pair<List<Int>, Int> {
    val indices = array.indices.drop(1).filter { array[it] < array[it - 1] }
    return indices to indices.size
}

fun countMinElem(array: List<Int>): Int {
    val minElement = array.minOrNull() ?: return 0
    return array.count { it == minElement }
}

fun elemThanThree(array: List<Int>): List<Int> {
    return array.groupingBy { it }.eachCount().filter { it.value > 3 }.keys.toList()
}

fun sortFreq(array: List<Int>): List<Int> {
    return array.groupingBy { it }.eachCount()
        .entries.sortedByDescending { it.value }
        .flatMap { entry -> List(entry.value) { entry.key } }
}
