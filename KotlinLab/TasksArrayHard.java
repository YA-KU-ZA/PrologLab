import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class TasksArrayHard {
    public static void main(String[] args) {
        List<Integer> array1 = Arrays.asList(4, 2, 3, 1, 5, 0, 2);
        List<Integer> array2 = Arrays.asList(4, 2, 3, 1, 5, 1, 2);
        List<Integer> array3 = Arrays.asList(5, 6, 2, 2, 3, 3, 3, 5, 5, 5);

        // Задача 1: Индексы элементов, которые меньше своего левого соседа, и количество таких чисел
        Pair<List<Integer>, Integer> result1 = indAndCount(array1);
        System.out.println("Индексы элементов, которые меньше своего левого соседа: " + result1.first);
        System.out.println("Количество таких элементов: " + result1.second);

        // Задача 2: Количество минимальных элементов
        int countMinElem = countMinElem(array2);
        System.out.println("Количество минимальных элементов: " + countMinElem);

        // Задача 3: Элементы, встречающиеся более трех раз
        List<Integer> elemThanThree = elemThanThree(array3);
        System.out.println("Элементы, встречающиеся более трех раз: " + elemThanThree);

        // Задача 4: Список, упорядоченный по частоте встречаемости элементов
        List<Integer> sortFreq = sortFreq(array3);
        System.out.println("Список, упорядоченный по частоте встречаемости элементов: " + sortFreq);
    }

    public static Pair<List<Integer>, Integer> indAndCount(List<Integer> array) {
        List<Integer> indices = IntStream.range(1, array.size())
                .filter(i -> array.get(i) < array.get(i - 1))
                .boxed()
                .collect(Collectors.toList());
        return new Pair<>(indices, indices.size());
    }

    public static int countMinElem(List<Integer> array) {
        Integer minElement = Collections.min(array);
        return (int) array.stream().filter(i -> i.equals(minElement)).count();
    }

    public static List<Integer> elemThanThree(List<Integer> array) {
        return array.stream()
                .collect(Collectors.groupingBy(i -> i, Collectors.counting()))
                .entrySet().stream()
                .filter(entry -> entry.getValue() > 3)
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    public static List<Integer> sortFreq(List<Integer> array) {
        Map<Integer, Long> frequencyMap = array.stream()
                .collect(Collectors.groupingBy(i -> i, Collectors.counting()));
        return frequencyMap.entrySet().stream()
                .sorted((e1, e2) -> Long.compare(e2.getValue(), e1.getValue()))
                .flatMap(entry -> IntStream.range(0, entry.getValue().intValue()).mapToObj(i -> entry.getKey()))
                .collect(Collectors.toList());
    }

    public static class Pair<K, V> {
        public final K first;
        public final V second;

        public Pair(K first, V second) {
            this.first = first;
            this.second = second;
        }
    }
}
