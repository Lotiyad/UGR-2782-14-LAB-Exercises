class Person {
  String name;
  int age;
  String address;

  
  Person({required this.name, required this.age, required this.address});

  
  void printInfo() {
    print("Name: $name");
    print("Age: $age");
    print("Address: $address");
  }
}

class Student extends Person {
  int rollNumber;
  List<int> marks;

 
  Student(
      {required String name,
      required int age,
      required String address,
      required this.rollNumber,
      required this.marks})
      : super(name: name, age: age, address: address);


  int calculateTotalMarks() {
    int total = 0;
    for (int mark in marks) {
      total += mark;
    }
    return total;
  }

  
  double calculateAverageMarks() {
    int total = calculateTotalMarks();
    return total / marks.length;
  }
}

void main() {

  Student student1 = Student(
      name: "John",
      age: 20,
      address: "123 Main St",
      rollNumber: 101,
      marks: [80, 85, 90, 75, 95]);

 
  print("Student 1:");
  student1.printInfo();
  print("Roll Number: ${student1.rollNumber}");
  print("Marks: ${student1.marks}");

  
  int totalMarks = student1.calculateTotalMarks();
  double averageMarks = student1.calculateAverageMarks();

  print("Total Marks: $totalMarks");
  print("Average Marks: $averageMarks");
}
