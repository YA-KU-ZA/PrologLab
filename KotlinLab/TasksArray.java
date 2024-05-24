import java.util.*;
import java.util.stream.*;

public class TasksArray {
    public static void main(String[] args) {
        List<Integer> array = Arrays.asList(3, 5, 1, 9, 4, 1, 7, 2);

        // Задача 1: Количество элементов, расположенных после последнего максимального
        long countAfLMax = elAfLMax(array);
        System.out.println("Количество элементов после последнего максимального: " + countAfLMax);

        // Задача 2: Переставить в обратном порядке элементы между минимальным и максимальным элементами
        List<Integer> reversMinAndMax = reversMinAndMax(array);
        System.out.println("Элементы в обратном порядке между минимальным и максимальным: " + reversMinAndMax);

        // Задача 3: Найти два наибольших элемента
        List<Integer> twoMaxElem = findTwoMaxElement(array);
        System.out.println("Два наибольших элемента: " + twoMaxElem);

        // Задача 4: Найти элементы, расположенные перед первым минимальным
        List<Integer> elBefFMin = elBefFMin(array);
        System.out.println("Элементы перед первым минимальным: " + elBefFMin);

        // Задача 5: Проверить, является ли элемент по указанному индексу локальным максимумом
        int indexToCheck = 3;
        boolean localMax = localMax(array, indexToCheck);
        System.out.println("Элемент по индексу " + indexToCheck + " является локальным максимумом: " + localMax);

        // Задача 6: Проверить, чередуются ли положительные и отрицательные числа
        List<Integer> alterArray = Arrays.asList(1, -2, 3, -4, 5, -6);
        boolean areAlter = areAlter(alterArray);
        System.out.println("Чередуются ли знаки в массиве: " + areAlter);
    }

    public static long elAfLMax(List<Integer> array) {
        Optional<Integer> maxOpt = array.stream().max(Integer::compareTo);
        if (maxOpt.isPresent()) {
            int max = maxOpt.get();
            return array.size() - array.lastIndexOf(max) - 1;
        }
        return 0;
    }

    public static List<Integer> reversMinAndMax(List<Integer> array) {
        Optional<Integer> minOpt = array.stream().min(Integer::compareTo);
        Optional<Integer> maxOpt = array.stream().max(Integer::compareTo);

        if (minOpt.isPresent() && maxOpt.isPresent()) {
            int minIndex = array.indexOf(minOpt.get());
            int maxIndex = array.indexOf(maxOpt.get());
            int startIndex = Math.min(minIndex, maxIndex);
            int endIndex = Math.max(minIndex, maxIndex);

            List<Integer> prefix = array.subList(0, startIndex + 1);
            List<Integer> middle = new ArrayList<>(array.subList(startIndex + 1, endIndex));
            Collections.reverse(middle);
            List<Integer> suffix = array.subList(endIndex, array.size());

            return Stream.of(prefix, middle, suffix)
                         .flatMap(Collection::stream)
                         .collect(Collectors.toList());
        }
        return array;
    }

    public static List<Integer> findTwoMaxElement(List<Integer> array) {
        return array.stream()
                    .sorted(Comparator.reverseOrder())
                    .limit(2)
                    .collect(Collectors.toList());
    }

    public static List<Integer> elBefFMin(List<Integer> array) {
        Optional<Integer> minOpt = array.stream().min(Integer::compareTo);
        if (minOpt.isPresent()) {
            int minIndex = array.indexOf(minOpt.get());
            return array.subList(0, minIndex);
        }
        return Collections.emptyList();
    }

    public static boolean localMax(List<Integer> array, int index) {
        if (index > 0 && index < array.size() - 1) {
            return array.get(index) > array.get(index - 1) && array.get(index) > array.get(index + 1);
        }
        return false;
    }

    public static boolean areAlter(List<Integer> array) {
        return IntStream.range(0, array.size() - 1)
                        .allMatch(i -> array.get(i) * array.get(i + 1) < 0);
    }
}
