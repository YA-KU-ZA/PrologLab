import java.util.*;
import java.util.regex.*;
import java.time.LocalDate;

class Passport implements Comparable<Passport> {
    private final String series;
    private final String number;
    private final LocalDate issueDate;
    private final String firstName;
    private final String lastName;
    private final String middleName;
    private final String issuedBy;
    private final String divisionCode;

    private static final Pattern SERIES_PATTERN = Pattern.compile("\\d{4}");
    private static final Pattern NUMBER_PATTERN = Pattern.compile("\\d{6}");
    private static final Pattern DIVISION_CODE_PATTERN = Pattern.compile("\\d{3}-\\d{3}");

    public Passport(String series, String number, LocalDate issueDate, String firstName, String lastName, String middleName, String issuedBy, String divisionCode) {
        if (!SERIES_PATTERN.matcher(series).matches()) {
            throw new IllegalArgumentException("Неверный формат серии");
        }
        if (!NUMBER_PATTERN.matcher(number).matches()) {
            throw new IllegalArgumentException("Неверный формат номера");
        }
        if (!DIVISION_CODE_PATTERN.matcher(divisionCode).matches()) {
            throw new IllegalArgumentException("Неверный формат кода подразделения");
        }
        this.series = series;
        this.number = number;
        this.issueDate = issueDate;
        this.firstName = firstName;
        this.lastName = lastName;
        this.middleName = middleName;
        this.issuedBy = issuedBy;
        this.divisionCode = divisionCode;
    }

    public String getSeries() {
        return series;
    }

    public String getNumber() {
        return number;
    }

    public LocalDate getIssueDate() {
        return issueDate;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public String getIssuedBy() {
        return issuedBy;
    }

    public String getDivisionCode() {
        return divisionCode;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Passport passport = (Passport) o;
        return series.equals(passport.series) && number.equals(passport.number);
    }

    @Override
    public int hashCode() {
        return Objects.hash(series, number);
    }

    @Override
    public int compareTo(Passport other) {
        int result = this.issueDate.compareTo(other.issueDate);
        if (result != 0) {
            return result;
        }
        result = this.series.compareTo(other.series);
        if (result != 0) {
            return result;
        }
        return this.number.compareTo(other.number);
    }

    @Override
    public String toString() {
        return "Паспорт{" +
                "Серия='" + series + '\'' +
                ", Номер='" + number + '\'' +
                ", Дата выдачи=" + issueDate +
                ", Имя='" + firstName + '\'' +
                ", Фамилия='" + lastName + '\'' +
                ", Отчество='" + middleName + '\'' +
                ", Кем выдано='" + issuedBy + '\'' +
                ", Код подразделения='" + divisionCode + '\'' +
                '}';
    }

    public static void main(String[] args) {
        Passport p1 = new Passport("1234", "567890", LocalDate.of(2020, 5, 20), "Иван", "Иванченко", "Иванович", "МВД РОСИИ ПО ГОРОДУ КРАСНОДАР", "123-456");
        Passport p2 = new Passport("1234", "567891", LocalDate.of(2021, 6, 15), "Жанна", "Петина", "Павловна", "МВД РОСИИ ПО ГОРОДУ КРАСНОДАР", "123-456");
        Passport p3 = new Passport("4321", "098765", LocalDate.of(2019, 3, 10), "Владислав", "Кирпанев", "Владимирович", "МВД РОСИИ ПО ГОРОДУ МОСКВА", "654-321");

        Set<Passport> hashSet = new HashSet<>(Arrays.asList(p1, p2, p3));
        System.out.println("HashSet:");
        hashSet.forEach(System.out::println);

        Set<Passport> treeSet = new TreeSet<>(Arrays.asList(p1, p2, p3));
        System.out.println("TreeSet:");
        treeSet.forEach(System.out::println);
    }
}
