import java.util.*;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

class Users implements Comparable<Users> {
	private String lastName;
	private String firstName;
	private String middleName;
	private Date birthDate;
	private String telegram;

	public Users(String lastName, String firstName, String middleName, Date birthDate, String telegram) {
			this.lastName = lastName;
			this.firstName = firstName;
			this.middleName = middleName;
			this.birthDate = birthDate;
			this.telegram = telegram;
	}

	public String getLastName() {
			return lastName;
	}

	public String getFirstName() {
			return firstName;
	}

	public String getMiddleName() {
			return middleName;
	}

	public Date getBirthDate() {
			return birthDate;
	}

	public String getTelegram() {
			return telegram;
	}

	@Override
	public int compareTo(Users other) {
			return this.birthDate.compareTo(other.birthDate);
	}

	@Override
	public boolean equals(Object obj) {
			if (this == obj) return true;
			if (obj == null || getClass() != obj.getClass()) return false;
			Users user = (Users) obj;
			return Objects.equals(lastName, user.lastName) &&
							Objects.equals(firstName, user.firstName) &&
							Objects.equals(middleName, user.middleName) &&
							Objects.equals(birthDate, user.birthDate) &&
							Objects.equals(telegram, user.telegram);
	}

	@Override
	public int hashCode() {
			return Objects.hash(lastName, firstName, middleName, birthDate, telegram);
	}

	@Override
	public String toString() {
			return "Пользователь{" +
							"Фамилия: '" + lastName + '\'' +
							", Имя: '" + firstName + '\'' +
							", Отчество: '" + middleName + '\'' +
							", Дата рождения:" + birthDate +
							", Телеграм: '" + telegram + '\'' +
							'}';
	}

	public static void main(String[] args) {
			Users user1 = new Users("Иванов", "Иван", "Иванович", new GregorianCalendar(1990, Calendar.JANUARY, 1).getTime(), "@ivanov");
			Users user2 = new Users("Петров", "Сетр", "Петрович", new GregorianCalendar(1995, Calendar.FEBRUARY, 2).getTime(), "@petrov");
			Users user3 = new Users("Сидоров", "Александр", "Александерович", new GregorianCalendar(1992, Calendar.MARCH, 3).getTime(), "@sidorov");

			Set<Users> hashSet = new HashSet<>(Arrays.asList(user1, user2, user3));
			Set<Users> treeSet = new TreeSet<>(Arrays.asList(user1, user2, user3));

			System.out.println("HashSet:");
			hashSet.forEach(System.out::println);

			System.out.println("\nTreeSet:");
			treeSet.forEach(System.out::println);

			System.out.println("\nКонтакт @ivanov in HashSet: " + hashSet.contains(new Users("Иванов", "Иван", "Иванович", new GregorianCalendar(1995, Calendar.JANUARY, 1).getTime(), "@ivanov")));
			System.out.println("Контакт @ivanov in TreeSet: " + treeSet.contains(new Users("Иванов", "Иван", "Иванович", new GregorianCalendar(1990, Calendar.JANUARY, 1).getTime(), "@ivanov")));
	}
}
