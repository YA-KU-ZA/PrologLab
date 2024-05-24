import java.time.LocalDate
import java.util.*
import java.util.regex.Pattern

data class CitizenPassport(
    val series: String,
    val number: String,
    val issueDate: LocalDate,
    val firstName: String,
    val lastName: String,
    val middleName: String,
    val issuedBy: String,
    val divisionCode: String
) : Comparable<CitizenPassport> {

    init {
        require(SERIES_PATTERN.matcher(series).matches()) { "Неправильный формат серии" }
        require(NUMBER_PATTERN.matcher(number).matches()) { "Неправильный формат номера" }
        require(DIVISION_CODE_PATTERN.matcher(divisionCode).matches()) { "Неправильный формат кода подразделения" }
    }

    override fun compareTo(other: CitizenPassport): Int {
        val dateComparison = issueDate.compareTo(other.issueDate)
        if (dateComparison != 0) return dateComparison
        val seriesComparison = series.compareTo(other.series)
        if (seriesComparison != 0) return seriesComparison
        return number.compareTo(other.number)
    }

    override fun toString(): String {
        return """
            Паспорт гражданина:
            Фамилия: $lastName
            Имя: $firstName
            Отчество: $middleName
            Серия: $series
            Номер: $number
            Дата выдачи: $issueDate
            Кем выдан: $issuedBy
            Код подразделения: $divisionCode
        """.trimIndent()
    }

    companion object {
        private val SERIES_PATTERN = Pattern.compile("\\d{4}")
        private val NUMBER_PATTERN = Pattern.compile("\\d{6}")
        private val DIVISION_CODE_PATTERN = Pattern.compile("\\d{3}-\\d{3}")
    }
}

fun main() {
    val p1 = CitizenPassport(
        "1234", "567890", LocalDate.of(2020, 5, 20),
        "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
    )
    val p2 = CitizenPassport(
        "1234", "567891", LocalDate.of(2021, 6, 15),
        "Жанна", "Петина", "Павловна", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
    )
    val p3 = CitizenPassport(
        "4321", "098765", LocalDate.of(2019, 3, 10),
        "Владислав", "Кирпанев", "Владимирович", "МВД РОССИИ ПО ГОРОДУ МОСКВА", "654-321"
    )

    val hashSet: Set<CitizenPassport> = hashSetOf(p1, p2, p3)
    println("HashSet:")
    hashSet.forEach(::println)
    println("-------------------------------------------------------------------------------------------------------------------")
    val treeSet: Set<CitizenPassport> = TreeSet(listOf(p1, p2, p3))
    println("TreeSet:")
    treeSet.forEach(::println)
}
