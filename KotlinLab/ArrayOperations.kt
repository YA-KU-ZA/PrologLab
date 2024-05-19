import java.util.*
import kotlin.collections.HashSet

fun main() {
    val scanner = Scanner(System.`in`)

    print("Введите количество элементов массива: ")
    val n = scanner.nextInt()

    val array = IntArray(n)
    println("Введите элементы массива: ")
    for (i in 0 until n) {
        array[i] = scanner.nextInt()
    }

    val sum = arrayOp(array, 0) { a, b -> a + b }
    val product = arrayOp(array, 1) { a, b -> a * b }
    val min = arrayOp(array, Int.MAX_VALUE) { a, b -> minOf(a, b) }
    val max = arrayOp(array, Int.MIN_VALUE) { a, b -> maxOf(a, b) }

    println("Сумма: $sum")
    println("Произведение: $product")
    println("Минимальный элемент массива: $min")
    println("Максимальный элемент массива: $max")

    val mostFreqElem = mostFreqElem(array.toList())
    println("Самый частый элемент: $mostFreqElem")

    val elemEvenOcc = elemEvenOcc(array.toList())
    println("Четные элементы, повторяющиеся четное количество раз: $elemEvenOcc")

    val posNumSumGreatTen = posNumSumGreatTen(array.toList())
    println("Список без отрицательных чисел, сумма цифр которых меньше 10: $posNumSumGreatTen")
    println("-------------------------------------------------------------------------------")
    val m: MutableList<User> = mutableListOf()
    val u1=User("Фам","Им","От","@a", Date(1999,7,2))
    val u2=User("Иванов","Иван","Иванович","@ivan", Date(1964,2,12))
    val u3=User("Василий","Пупкин","","@lesnik", Date(1988,10,30))
    val u4=User("Иванов","Иван","Иванович","@ivan", Date(1964,2,12))
    m.add(u1)
    m.add(u2)
    m.add(u3)
    m.add(u4)
    for (x in m)x.write()
    println("-------------------------------------------------------------------------------")
    m.sort()
    for (x in m)x.write()
    println("-------------------------------------------------------------------------------")
    val h: HashSet<User> = hashSetOf()
    h.add(u1)
    h.add(u2)
    h.add(u3)
    h.add(u4)
    for (x in h)x.write()
}

fun arrayOp(array: IntArray, initialValue: Int, func: (Int, Int) -> Int): Int {
    var result = initialValue
    for (value in array) {
        result = func(result, value)
    }
    return result
}

fun mostFreqElem(list: List<Int>): Int? {
    return list.groupingBy { it }.eachCount().maxByOrNull { it.value }?.key
}

fun elemEvenOcc(list: List<Int>): List<Int> {
    return list.groupingBy { it }
        .eachCount()
        .filter { (key, value) -> key % 2 == 0 && value % 2 == 0 }
        .keys.toList()
}

fun posNumSumGreatTen(list: List<Int>): List<Int> {
    return list.filter { number ->
        !(number < 0 || number.toString().sumOf { Character.getNumericValue(it) } > 10)
    }
}