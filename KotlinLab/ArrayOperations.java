import java.util.*;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

class ArrayOperations {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.print("Введите количество элементов массива: ");
        int n = scanner.nextInt();

        int[] array = new int[n];
        System.out.println("Введите элементы массива: ");
        for (int i = 0; i < n; i++) {
            array[i] = scanner.nextInt();
        }

        int sum = arrayOp(array, 0, Integer::sum);
        int product = arrayOp(array, 1, (a, b) -> a * b);
        int min = arrayOp(array, Integer.MAX_VALUE, Math::min);
        int max = arrayOp(array, Integer.MIN_VALUE, Math::max);

        System.out.println("Сумма: " + sum);
        System.out.println("Произвведение: " + product);
        System.out.println("Минимальный элемент массива: " + min);
        System.out.println("Максимальный элемент массива: " + max);

        int mostFrequent = mostFreqElem(array);
        System.out.println("Наиболее часто встречающийся элемент: " + mostFrequent);

        List<Integer> elemEvenOccElem = elemEvenOcc(array);
        System.out.println("Четные элементы, повторяющиеся четное количество раз: " + elemEvenOccElem);

        List<Integer> posNumSumGreatTenList = posNumSumGreatTen(array);
        System.out.println("Отфильтрованный список (удалены отрицательные числа с суммой цифр < 10): " + posNumSumGreatTenList);
    }

    public static int arrayOp(int[] array, int initialValue, BiFunction<Integer, Integer, Integer> func) {
        int result = initialValue;
        for (int value : array) {
            result = func.apply(result, value);
        }
        return result;
    }

    public static int mostFreqElem(int[] array) {
        Map<Integer, Long> frequencyMap = Arrays.stream(array).boxed()
            .collect(Collectors.groupingBy(e -> e, Collectors.counting()));

        return Collections.max(frequencyMap.entrySet(), Map.Entry.comparingByValue()).getKey();
    }

    public static List<Integer> elemEvenOcc(int[] array) {
        Map<Integer, Long> frequencyMap = Arrays.stream(array).boxed()
            .filter(e -> e % 2 == 0)
            .collect(Collectors.groupingBy(e -> e, Collectors.counting()));

        return frequencyMap.entrySet().stream()
            .filter(entry -> entry.getValue() % 2 == 0)
            .map(Map.Entry::getKey)
            .collect(Collectors.toList());
    }

    public static List<Integer> posNumSumGreatTen(int[] array) {
			return Arrays.stream(array).boxed()
					.filter(e -> !(e < 0 || digitSum(e) > 10))
					.collect(Collectors.toList());
		}

    private static int digitSum(int number) {
        int sum = 0;
        while (number != 0) {
            sum += number % 10;
            number /= 10;
        }
        return sum;
    }
}