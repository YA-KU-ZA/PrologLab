import java.lang.System.`in`
import java.util.*

class Main {
    //Задание 1
    //максимум из 3
    fun max3(x: Int, y: Int, z: Int): Int = if (x > y) if (x > z) x else z else if (y > z) y else z

    //факториал вверх
    fun factUp(n: Int): Int = if (n <= 1) 1 else factUp(n - 1) * n

    //факториал вниз
    tailrec fun factDown(n: Int, a: Int): Int = if (n <= 1) n * a else factDown(n - 1, n * a)
    fun factDown(n: Int): Int = factDown(n, 1)

    //сумма цифр вниз
    fun sumcda(n: Int, a: Int): Int = if (n < 10) n + a else sumcda(n / 10, a + (n % 10))
    fun sumcd(n: Int): Int = sumcda(n, 0)

    //сумма цифр вверх
    fun sumc(n: Int): Int = if (n < 10) n else (n % 10) + sumc(n / 10)

    //произведение цифр вверх
    fun mulc(n: Int): Int = if (n < 10) n else (n % 10) * mulc(n / 10)

    //функция высшего порядка возвращает функцию
    fun calc(f: Boolean): (Int) -> Int = if (f) ::sumc else ::mulc

    //функция высшего порядка принимает функцию
    tailrec fun digits(n: Int, a: Int = 0, f: (Int, Int) -> Int): Int =
        if (n == 0) a else digits(n / 10, f(a, n % 10), f)

    //вызовы через лямбды
    fun sumd(n: Int): Int = digits(n, 0) { a, b -> (a + b) }
    fun muld(n: Int): Int = digits(n, 1) { a, b -> (a * b) }
    fun maxd(n: Int): Int = digits(n / 10, n % 10) { a, b -> if (a > b) a else b }
    fun mind(n: Int): Int = digits(n / 10, n % 10) { a, b -> if (a < b) a else b }

    //Задание 2
    //Найти произведение цифр числа
    fun productDigits(number: Int): Int {
        var num = number
        var product = 1
        while (num > 0) {
            val digit = num % 10
            product *= digit
            num /= 10
        }
        return product
    }
    //Найти количество нечетных цифр числа, больших 3
    fun foundDigits(number: Int): Int {
        var num = number
        var count = 0
        while (num > 0) {
            val digit = num % 10
            if (digit > 3 && digit % 2 != 0) {
                count++
            }
            num /= 10
        }
        return count
    }
    //Найти НОД двух чисел
    fun nod(a: Int, b: Int): Int {
        var x = a
        var y = b
        while (y != 0) {
            val temp = y
            y = x % y
            x = temp
        }
        return x
    }

    //Задание 3
    //Найти произведение цифр числа
    fun productDigitsUp(number: Int): Int {
        if (number < 10) return number
        return (number % 10) * productDigitsUp(number / 10)
    }

    tailrec fun productDigitsDown(number: Int, accumulator: Int = 1): Int {
        if (number == 0) return accumulator
        return productDigitsDown(number / 10, accumulator * (number % 10))
    }

    //Найти количество нечетных цифр числа, больших 3
    fun foundDigitsUp(number: Int): Int {
        if (number == 0) return 0
        val digit = number % 10
        val countForRest = foundDigitsUp(number / 10)
        return if (digit > 3 && digit % 2 != 0) 1 + countForRest else countForRest
    }

    tailrec fun foundDigitsDown(number: Int, accumulator: Int = 0): Int {
        if (number == 0) return accumulator
        val digit = number % 10
        val newAccumulator = if (digit > 3 && digit % 2 != 0) accumulator + 1 else accumulator
        return foundDigitsDown(number / 10, newAccumulator)
    }

    //Найти НОД двух чисел
    fun nodUp(a: Int, b: Int): Int {
        if (b == 0) return a
        return nodUp(b, a % b)
    }

    tailrec fun nodDown(a: Int, b: Int): Int {
        if (b == 0) return a
        return nodDown(b, a % b)
    }

    //Задание 4
    fun factOfNod(nodDown: (Int, Int) -> Int, factDown: (Int) -> Int): (Int, Int) -> Int {
        return { a, b ->
            val nod = nodDown(a, b)
            factDown(nod)
        }
    }

    //Задание 7
    //Функция для проверки числа на простоту
    fun simple(n: Int): Boolean {
        if (n <= 1) return false
        for (i in 2 until n) {
            if (n % i == 0) return false
        }
        return true
    }

    // Функция высшего порядка для нахождения суммы простых делителей числа
    fun sumOfSimpleFact(number: Int): Int {
        var sum = 0
        for (i in 1..number) {
            if (number % i == 0 && simple(i)) {
                sum += i
            }
        }
        return sum
    }

    // Функция высшего порядка для нахождения произведения делителей числа
    // с условием, что сумма цифр делителя меньше суммы цифр исходного числа
    fun productOfSimpleFact(number: Int, sumcd: (Int) -> Int): Int {
        var product = 1
        val sumOfNumber = sumcd(number)
        for (i in 1..number) {
            if (number % i == 0 && sumcd(i) < sumOfNumber) {
                product *= i
            }
        }
        return product
    }

    // Функция для нахождения суммы цифр числа
    fun sumDigits(number: Int): Int {
        return sumcd(number)
    }

    fun main() {
        val scanner = Scanner(System.`in`)
        print("Введите число: ")
        val number: Int = scanner.nextInt()

        // Вызов функций высшего порядка
        val sumOfSimple = sumOfSimpleFact(number)
        val productOfSimple = productOfSimpleFact(number, this::sumDigits)

        println("Сумма простых делителей числа $number: $sumOfSimple")
        println("Произведение делителей числа $number, сумма цифр которых меньше суммы цифр исходного числа: $productOfSimple")
    }
}

fun main() = Main().main()