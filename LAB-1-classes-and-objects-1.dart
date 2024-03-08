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

void main() {

  Person person1 = Person(name: "John", age: 30, address: "123 Main St");
  Person person2 = Person(name: "Alice", age: 25, address: "456 Elm St");

 
  print("Person 1:");
  person1.printInfo();

  print("\nPerson 2:");
  person2.printInfo();

  
  person1.age = 35;
  person2.address = "789 Oak St";

  
  print("\nPerson 1 (After Modification):");
  person1.printInfo();

  print("\nPerson 2 (After Modification):");
  person2.printInfo();
}
