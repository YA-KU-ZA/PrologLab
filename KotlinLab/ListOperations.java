import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

//Решить задачи с применением чистых функций и возможностей коллекций Java.
//Реализовать функцию, которая для данного списка указывает, сколько элементов из
//него могут быть квадратом какого-то из элементов списка. Реализовать функцию, которая по трем спискам составляет список,
//состоящий из кортежей длины 3, где каждый кортеж (ai,bi,ci) с номером I получен следующим образом:
//Ai – I по убыванию элемент первого списка
//Bi – I по возрастанию суммы цифр элемент второго списка
//Сi - I по убыванию количества делителей элемент третьего списка
//Все элементы одного списка различны.
//Если в списках B или C два элемента имеют одинаковый коэффициент, большим считается элемент, больший по абсолютной величине.
public class ListOperations {

    public static void main(String[] args) {
        List<Integer> list = Arrays.asList(1, 2, 3, 4, 9, 16, 25);
        long count = countSqElem(list);
        System.out.println("Количество элементов, которые могут быть квадратами других элементов: " + count);

        List<Integer> listA = Arrays.asList(1, 2, 3, 4, 5);
        List<Integer> listB = Arrays.asList(12, 45, 78, 23, 56);
        List<Integer> listC = Arrays.asList(6, 28, 12, 18, 20);

        List<Triple> triples = createTripleList(listA, listB, listC);
        triples.forEach(System.out::println);
    }

    public static long countSqElem(List<Integer> list) {
        Set<Integer> squares = list.stream()
                .map(x -> x * x)
                .collect(Collectors.toSet());

        return list.stream()
                .filter(squares::contains)
                .count();
    }

    public static List<Triple> createTripleList(List<Integer> listA, List<Integer> listB, List<Integer> listC) {
        List<Integer> sortedA = listA.stream()
                .sorted(Comparator.reverseOrder())
                .collect(Collectors.toList());

        List<Integer> sortedB = listB.stream()
                .sorted(Comparator.comparingInt(ListOperations::sumDigits))
                .collect(Collectors.toList());

        List<Integer> sortedC = listC.stream()
                .sorted((a, b) -> {
                    int cmp = Integer.compare(countDivis(b), countDivis(a));
                    if (cmp == 0) {
                        return Integer.compare(Math.abs(b), Math.abs(a));
                    }
                    return cmp;
                })
                .collect(Collectors.toList());

        return IntStream.range(0, Math.min(sortedA.size(), Math.min(sortedB.size(), sortedC.size())))
                .mapToObj(i -> new Triple(sortedA.get(i), sortedB.get(i), sortedC.get(i)))
                .collect(Collectors.toList());
    }

    private static int sumDigits(int number) {
        return String.valueOf(Math.abs(number))
                .chars()
                .map(Character::getNumericValue)
                .sum();
    }

    private static int countDivis(int number) {
        int absNumber = Math.abs(number);
        return (int) IntStream.rangeClosed(1, absNumber)
                .filter(i -> absNumber % i == 0)
                .count();
    }

    public static class Triple {
        final int a, b, c;

        public Triple(int a, int b, int c) {
            this.a = a;
            this.b = b;
            this.c = c;
        }

        @Override
        public String toString() {
            return "(" + a + ", " + b + ", " + c + ")";
        }
    }
}
