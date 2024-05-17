import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

internal class NumericFunctionsTest {

    //Тесты для 1 задания
    @Test
    fun max3() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.max3(3,10,5))
    }

    @Test
    fun factup() {
        val main = Main()
        val expected = 120
        assertEquals(expected, main.factUp(5))
    }

    @Test
    fun factDown() {
        val main = Main()
        val expected = 720
        assertEquals(expected, main.factDown(6))
    }

    @Test
    fun calc() {
        val main = Main()
        val expected = 10
        assertEquals(expected, main.calc(true)(1234))
    }

    @Test
    fun sumd() {
        val main = Main()
        val expected = 15
        assertEquals(expected, main.sumd(12345))
    }

    @Test
    fun muld() {
        val main = Main()
        val expected = 126
        assertEquals(expected, main.muld(367))
    }

    @Test
    fun maxd() {
        val main = Main()
        val expected = 7
        assertEquals(expected, main.maxd(123745))
    }

    @Test
    fun mind() {
        val main = Main()
        val expected = 2
        assertEquals(expected, main.mind(923745))
    }

    //Тесты для 2 задания
    @Test
    fun testProductDigits() {
        val main = Main()
        val expected = 6
        assertEquals(expected, main.productDigits(123))
    }

    @Test
    fun testFoundDigits(){
        val main = Main()
        val expected = 1
        assertEquals(expected, main.foundDigits(12345))
    }

    @Test
    fun testNod(){
        val main = Main()
        assertEquals(6, main.nod(54,24))
    }

    //Тесты для 3 задания
    @Test
    fun testProductDigitsUp(){
        val main = Main()
        assertEquals(24,main.productDigitsUp(1234))
    }

    @Test
    fun testProductDigitsDown(){
        val main = Main()
        assertEquals(0,main.productDigitsDown(100))
    }

    @Test
    fun testFoundDigitsUp(){
        val main = Main()
        assertEquals(1,main.foundDigitsUp(12345))
    }

    @Test
    fun testFoundDigitsDown(){
        val main = Main()
        assertEquals(3,main.foundDigitsDown(13579))
    }

    @Test
    fun testNodUp(){
        val main = Main()
        assertEquals(6,main.nodUp(48,18))
    }

    @Test
    fun testNodDown(){
        val main = Main()
        assertEquals(6,main.nodDown(54,24))
    }

    //Тест для 4 задания
    @Test
    fun testFactOfNod() {
        val main = Main()
        val factOfNod = main.factOfNod(main::nodDown, main::factDown)
        assertEquals(24, factOfNod(8, 12))
        assertEquals(1, factOfNod(5, 13))
        assertEquals(720, factOfNod(54, 24))
    }

    //Тесты для 7 задания
    @Test
    fun testSumOfSimpleFact() {
        val main = Main()
        assertEquals(7, main.sumOfSimpleFact(10)) // Простые делители 10: 2 и 5
        assertEquals(0, main.sumOfSimpleFact(1))  // У числа 1 отсутствуют простые делители
        assertEquals(9, main.sumOfSimpleFact(28)) // Простые делители 28: 2 и 7
    }

    @Test
    fun testProductOfSimpleFact() {
        val main = Main()
        assertEquals(1, main.productOfSimpleFact(10, main::sumDigits)) // Делители 10: 1, 2, 5, 10.
        assertEquals(1, main.productOfSimpleFact(1, main::sumDigits))  // Делители 1: 1.
        assertEquals(56, main.productOfSimpleFact(784, main::sumDigits)) // Делители 28: 1, 2, 4, 7, 14, 28
    }
}