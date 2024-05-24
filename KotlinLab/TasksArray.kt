fun main() {
    val array = listOf(3, 5, 1, 9, 4, 1, 7, 2)

    // Задача 1: Количество элементов, расположенных после последнего максимального
    val countAfLMax = elAfLMax(array)
    println("Количество элементов после последнего максимального: $countAfLMax")

    // Задача 2: Переставить в обратном порядке элементы между минимальным и максимальным элементами
    val reversMinAndMax = reversMinAndMax(array)
    println("Элементы в обратном порядке между минимальным и максимальным: $reversMinAndMax")

    // Задача 3: Найти два наибольших элемента
    val twoMaxElem = findTwoMaxElement(array)
    println("Два наибольших элемента: $twoMaxElem")

    // Задача 4: Найти элементы, расположенные перед первым минимальным
    val elBefFMin = elBefFMin(array)
    println("Элементы перед первым минимальным: $elBefFMin")

    // Задача 5: Проверить, является ли элемент по указанному индексу локальным максимумом
    val indexToCheck = 3
    val localMax = localMax(array, indexToCheck)
    println("Элемент по индексу $indexToCheck является локальным максимумом: $localMax")

    // Задача 6: Проверить, чередуются ли положительные и отрицательные числа
    val alterArray = listOf(1, -2, 3, -4, 5, -6)
    val areAlter = areAlter(alterArray)
    println("Чередуются ли знаки в массиве: $areAlter")
}

fun elAfLMax(array: List<Int>): Int {
    return array.size - array.lastIndexOf(array.maxOrNull()) - 1
}

fun reversMinAndMax(array: List<Int>): List<Int> {
    val minIndex = array.indexOf(array.minOrNull())
    val maxIndex = array.indexOf(array.maxOrNull())
    val (startIndex, endIndex) = if (minIndex < maxIndex) minIndex to maxIndex else maxIndex to minIndex

    return array.take(startIndex + 1) +
            array.subList(startIndex + 1, endIndex).reversed() +
            array.drop(endIndex)
}

fun findTwoMaxElement(array: List<Int>): List<Int> {
    return array.sortedDescending().take(2)
}

fun elBefFMin(array: List<Int>): List<Int> {
    return array.take(array.indexOf(array.minOrNull()))
}

fun localMax(array: List<Int>, index: Int): Boolean {
    return (index > 0 && array[index] > array[index - 1]) &&
            (index < array.size - 1 && array[index] > array[index + 1])
}

fun areAlter(array: List<Int>): Boolean {
    return array.zipWithNext { a, b -> a * b < 0 }.all { it }
}
