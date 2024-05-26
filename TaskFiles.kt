import java.io.File

class Main {

    // Задание 2
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

    // Задание 3
    fun productDigitsUp(number: Int): Int {
        if (number < 10) return number
        return (number % 10) * productDigitsUp(number / 10)
    }

    tailrec fun productDigitsDown(number: Int, accumulator: Int = 1): Int {
        if (number == 0) return accumulator
        return productDigitsDown(number / 10, accumulator * (number % 10))
    }

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

    fun nodUp(a: Int, b: Int): Int {
        if (b == 0) return a
        return nodUp(b, a % b)
    }

    tailrec fun nodDown(a: Int, b: Int): Int {
        if (b == 0) return a
        return nodDown(b, a % b)
    }

    // Функция высшего порядка, возвращающая нужную функцию
    fun getFunctionByName(name: String): (Int) -> Int {
        val functionsMap: Map<String, (Int) -> Int> = mapOf(
            "productDigits" to ::productDigits,
            "productDigitsUp" to ::productDigitsUp,
            "productDigitsDown" to this::productDigitsDown,
            "foundDigits" to ::foundDigits,
            "foundDigitsUp" to ::foundDigitsUp,
            "foundDigitsDown" to this::foundDigitsDown
        )

        return functionsMap[name] ?: throw IllegalArgumentException("Unknown function name: $name")
    }

    // Функция для обработки входного файла и записи результатов в выходной файл
    fun processFile(inputFilePath: String, outputFilePath: String) {
        val inputFile = File(inputFilePath)
        val outputFile = File(outputFilePath)

        if (!inputFile.exists()) {
            println("Error: Input file does not exist.")
            return
        }

        val results = mutableListOf<String>()
        inputFile.forEachLine { line ->
            val parts = line.split(" ")
            if (parts.size != 2) {
                println("Error: Invalid file structure.")
                return
            }
            try {
                val number = parts[0].toInt()
                val functionName = parts[1]
                val function = getFunctionByName(functionName)
                val result = function(number)
                results.add("$number $functionName $result")
            } catch (e: Exception) {
                println("Error processing line: $line. ${e.message}")
                return
            }
        }

        outputFile.writeText(results.joinToString("\n"))
        println("Results written to $outputFilePath")
    }
}

fun main(args: Array<String>) {
    if (args.size != 2) {
        println("Usage: <inputFilePath> <outputFilePath>")
        return
    }

    val inputFilePath = args[0]
    val outputFilePath = args[1]

    Main().processFile(inputFilePath, outputFilePath)
}
