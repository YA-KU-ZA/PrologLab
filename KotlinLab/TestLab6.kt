import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import org.junit.jupiter.api.assertThrows
import java.time.LocalDate
import java.util.*

//Lab.6_Zad.1
class ArrayOperationsTest {

    @Test
    fun testArrayOpSum() {
        val array = intArrayOf(1, 2, 3, 4, 5)
        val result = arrayOp(array, 0) { a, b -> a + b }
        assertEquals(15, result)
    }

    @Test
    fun testArrayOpProduct() {
        val array = intArrayOf(1, 2, 3, 4, 5)
        val result = arrayOp(array, 1) { a, b -> a * b }
        assertEquals(120, result)
    }

    @Test
    fun testArrayOpMin() {
        val array = intArrayOf(1, 2, 3, -4, 5)
        val result = arrayOp(array, Int.MAX_VALUE) { a, b -> minOf(a, b) }
        assertEquals(-4, result)
    }

    @Test
    fun testArrayOpMax() {
        val array = intArrayOf(1, 2, 3, 4, 5)
        val result = arrayOp(array, Int.MIN_VALUE) { a, b -> maxOf(a, b) }
        assertEquals(5, result)
    }

    @Test
    fun testMostFreqElem() {
        val list = listOf(1, 2, 2, 3, 3, 3, 4, 4, 4, 4)
        val result = mostFreqElem(list)
        assertEquals(4, result)
    }

    @Test
    fun testElemEvenOcc() {
        val list = listOf(2, 2, 4, 4, 4, 6, 6, 6, 6)
        val result = elemEvenOcc(list)
        assertEquals(listOf(2, 6), result)
    }

    @Test
    fun testPosNumSumGreatTen() {
        val list = listOf(1, 2254, 3, 4545, -5, 5)
        val result = posNumSumGreatTen(list)
        assertEquals(listOf(1, 3, 5), result)
    }
}
//Lab.6_Zad.2
class ListOperationsTest {
    @Test
    fun testCountSqElem() {
        val list1 = listOf(1, 2, 3, 4, 9, 16, 25)
        val count1 = countSqElem(list1)
        assertEquals(4, count1)

        val list2 = listOf(2, 4, 8, 16, 32, 64)
        val count2 = countSqElem(list2)
        assertEquals(3, count2)

        val list3 = listOf(10, 20, 30)
        val count3 = countSqElem(list3)
        assertEquals(0, count3)
    }

    @Test
    fun testCreateTripleList() {
        val listA = listOf(1, 2, 3, 4, 5)
        val listB = listOf(12, 45, 78, 23, 56)
        val listC = listOf(6, 28, 12, 18, 20)

        val result = createTripleList(listA, listB, listC)
        val expected = listOf(
            Triple(5, 12, 28),
            Triple(4, 23, 20),
            Triple(3, 45, 18),
            Triple(2, 56, 12),
            Triple(1, 78, 6)
        )
        assertEquals(expected, result)
    }

    @Test
    fun testSumDigits() {
        assertEquals(3, 12.sumDigits())
        assertEquals(9, 45.sumDigits())
        assertEquals(15, 78.sumDigits())
        assertEquals(5, 23.sumDigits())
        assertEquals(11, 56.sumDigits())
    }

    @Test
    fun testCountDivis() {
        assertEquals(4, 6.countDivis()) // 1, 2, 3, 6
        assertEquals(6, 28.countDivis()) // 1, 2, 4, 7, 14, 28
        assertEquals(6, 12.countDivis()) // 1, 2, 3, 4, 6, 12
        assertEquals(6, 18.countDivis()) // 1, 2, 3, 6, 9, 18
        assertEquals(6, 20.countDivis()) // 1, 2, 4, 5, 10, 20
    }
}

//Lab.6_Zad.3
class ArrayFunctionsTest {

    @Test
    fun testElAfLMax() {
        val array = listOf(3, 5, 1, 9, 4, 1, 7, 2)
        val result = elAfLMax(array)
        assertEquals(4, result)

        val array2 = listOf(1, 2, 3, 4, 5)
        val result2 = elAfLMax(array2)
        assertEquals(0, result2)
    }

    @Test
    fun testReversMinAndMax() {
        val array = listOf(0, 3, 5, 1, 9, 4, 1, 7, 2, 10)
        val result = reversMinAndMax(array)
        val expected = listOf(0, 2, 7, 1, 4, 9, 1, 5, 3, 10)
        assertEquals(expected, result)

        val array2 = listOf(3, 1, 5, 9, 7, 2)
        val result2 = reversMinAndMax(array2)
        val expected2 = listOf(3, 1, 5, 9, 7, 2)
        assertEquals(expected2, result2)
    }

    @Test
    fun testFindTwoMaxElement() {
        val array = listOf(3, 5, 1, 9, 4, 1, 7, 2)
        val result = findTwoMaxElement(array)
        val expected = listOf(9, 7)
        assertEquals(expected, result)

        val array2 = listOf(1, 2)
        val result2 = findTwoMaxElement(array2)
        val expected2 = listOf(2, 1)
        assertEquals(expected2, result2)
    }

    @Test
    fun testElBefFMin() {
        val array = listOf(3, 5, 1, 9, 4, 1, 7, 2)
        val result = elBefFMin(array)
        val expected = listOf(3, 5)
        assertEquals(expected, result)

        val array2 = listOf(5, 4, 3, 2, 1)
        val result2 = elBefFMin(array2)
        val expected2 = listOf(5, 4, 3, 2)
        assertEquals(expected2, result2)
    }

    @Test
    fun testLocalMax() {
        val array = listOf(3, 5, 1, 9, 4, 1, 7, 2)
        assertTrue(localMax(array, 1))
        assertTrue(localMax(array, 3))
        assertTrue(!localMax(array, 2))
        assertTrue(!localMax(array, 4))
    }

    @Test
    fun testAreAlter() {
        val array = listOf(1, -2, 3, -4, 5, -6)
        assertTrue(areAlter(array))

        val array2 = listOf(1, 2, 3, 4, 5, 6)
        assertTrue(!areAlter(array2))

        val array3 = listOf(-1, 2, -3, 4, -5, 6)
        assertTrue(areAlter(array3))
    }
}//Lab.6_Zad.4
class CitizenPassportTest {

    @Test
    fun testValidCitizenPassport() {
        val passport = CitizenPassport(
            "1234", "567890", LocalDate.of(2020, 5, 20),
            "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
        )
        assertNotNull(passport)
        assertEquals("1234", passport.series)
        assertEquals("567890", passport.number)
        assertEquals(LocalDate.of(2020, 5, 20), passport.issueDate)
        assertEquals("Иван", passport.firstName)
        assertEquals("Иванченко", passport.lastName)
        assertEquals("Иванович", passport.middleName)
        assertEquals("МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", passport.issuedBy)
        assertEquals("123-456", passport.divisionCode)
    }

    @Test
    fun testInvalidSeries() {
        val exception = assertThrows<IllegalArgumentException> {
            CitizenPassport(
                "12A4", "567890", LocalDate.of(2020, 5, 20),
                "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
            )
        }
        assertEquals("Неправильный формат серии", exception.message)
    }

    @Test
    fun testInvalidNumber() {
        val exception = assertThrows<IllegalArgumentException> {
            CitizenPassport(
                "1234", "56A890", LocalDate.of(2020, 5, 20),
                "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
            )
        }
        assertEquals("Неправильный формат номера", exception.message)
    }

    @Test
    fun testInvalidDivisionCode() {
        val exception = assertThrows<IllegalArgumentException> {
            CitizenPassport(
                "1234", "567890", LocalDate.of(2020, 5, 20),
                "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "12A-456"
            )
        }
        assertEquals("Неправильный формат кода подразделения", exception.message)
    }

    @Test
    fun testComparison() {
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

        assertTrue(p3 < p1)
        assertTrue(p1 < p2)
        assertTrue(p3 < p2)
    }

    @Test
    fun testToString() {
        val passport = CitizenPassport(
            "1234", "567890", LocalDate.of(2020, 5, 20),
            "Иван", "Иванченко", "Иванович", "МВД РОССИИ ПО ГОРОДУ КРАСНОДАР", "123-456"
        )
        val expected = """
            Паспорт гражданина:
            Фамилия: Иванченко
            Имя: Иван
            Отчество: Иванович
            Серия: 1234
            Номер: 567890
            Дата выдачи: 2020-05-20
            Кем выдан: МВД РОССИИ ПО ГОРОДУ КРАСНОДАР
            Код подразделения: 123-456
        """.trimIndent()
        assertEquals(expected, passport.toString())
    }

    @Test
    fun testHashSet() {
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
        assertEquals(3, hashSet.size)
        assertTrue(hashSet.containsAll(listOf(p1, p2, p3)))
    }

    @Test
    fun testTreeSet() {
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

        val treeSet: Set<CitizenPassport> = TreeSet(listOf(p1, p2, p3))
        val expectedOrder = listOf(p3, p1, p2)
        assertEquals(expectedOrder, treeSet.toList())
    }
}

class HardArrayFunctionsTest {

    @Test
    fun testIndAndCount() {
        val array = listOf(4, 2, 3, 1, 5, 0, 2)
        val (indices, count) = indAndCount(array)
        assertEquals(listOf(1, 3, 5), indices)
        assertEquals(3, count)
    }

    @Test
    fun testIndAndCountNoElements() {
        val array = listOf(1, 2, 3, 4, 5)
        val (indices, count) = indAndCount(array)
        assertTrue(indices.isEmpty())
        assertEquals(0, count)
    }

    @Test
    fun testCountMinElem() {
        val array = listOf(4, 2, 3, 1, 5, 1, 2)
        val count = countMinElem(array)
        assertEquals(2, count)
    }

    @Test
    fun testCountMinElemSingleElement() {
        val array = listOf(1)
        val count = countMinElem(array)
        assertEquals(1, count)
    }

    @Test
    fun testElemThanThree() {
        val array = listOf(5, 6, 2, 2, 3, 3, 3, 5, 5, 5)
        val result = elemThanThree(array)
        assertEquals(listOf(5), result)
    }

    @Test
    fun testElemThanThreeNoElements() {
        val array = listOf(1, 2, 3, 4, 5)
        val result = elemThanThree(array)
        assertTrue(result.isEmpty())
    }

    @Test
    fun testSortFreq() {
        val array = listOf(5, 6, 2, 2, 3, 3, 3, 5, 5, 5)
        val sorted = sortFreq(array)
        assertEquals(listOf(5, 5, 5, 5, 3, 3, 3, 2, 2, 6), sorted)
    }

    @Test
    fun testSortFreqSingleElement() {
        val array = listOf(1)
        val sorted = sortFreq(array)
        assertEquals(listOf(1), sorted)
    }
}