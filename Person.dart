void main() {
  Person john = Person.generic(20, "John", 71.2, 177);
  Person mark = Person.generic(30, "Mark", 85, 180);
  Person test = Person.custom(22, "Test", 50);
  Person smol = Person.verySmallPerson();
  Person user = Person();
  Student student = Student(18, "Student", 65, 177, 1, 5);

  var personList = [john, user, mark, test, smol, student];

  toStringList(personList);
  //toString(student);
  //toString(john);
  //toString(mark);
  //toString(test);
  //toString(smol);
  //toString(user);
}

class Person {
  int age = 0;
  String name = "";
  double? weight = 0.0;
  double? height = 0.0;
  Person();
  Person.generic(this.age, this.name, this.weight, this.height);
  Person.custom(this.age, this.name, [this.weight, this.height]);
  Person.verySmallPerson({this.height = 50});

  int getAge() {
    return age;
  }

  String getName() {
    return name;
  }

  double? getWeight() {
    return weight;
  }

  double? getHeight() {
    return height;
  }

  void setAge(int age) {
    this.age = age;
  }

  void setName(String name) {
    this.name = name;
  }

  void setWeight(double weight) {
    this.weight = weight;
  }

  void setHeight(double height) {
    this.height = height;
  }
}

class Student extends Person {
  int id = 0;
  int creditPoints = 0;
  Student.custom(this.id, this.creditPoints);
  Student(int age, String name, double weight, double height, this.id,
      this.creditPoints) {
    this.age = age;
    this.name = name;
    this.weight = weight;
    this.height = height;
  }
}

void toString(Person person) {
  print("Name: ${person.name}");
  print("Age:  ${person.age}");
  print("Weight: ${person.weight}");
  print("Height: ${person.height}");
}

void toStringList(List list) {
  list.forEach((person) => {toString(person)});
}
