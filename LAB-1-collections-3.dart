void main() {
  
  Map<String, int> studentMarks = {};

  
  studentMarks['Alice'] = 85;
  studentMarks.putIfAbsent('Bob', () => 90);
  studentMarks.putIfAbsent('Charlie', () => 75);


  print("Student Marks:");
  studentMarks.forEach((name, mark) {
    print("$name: $mark");
  });

  
  String searchName = 'Alice';
  if (studentMarks.containsKey(searchName)) {
    print("$searchName's mark is ${studentMarks[searchName]}");
  } else {
    print("$searchName not found in the map.");
  }
}
