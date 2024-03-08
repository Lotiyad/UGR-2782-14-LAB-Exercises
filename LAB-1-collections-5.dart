class Student {
  String name;
  List<int> marks;

  
  Student(this.name, this.marks);

  
  double findAverageMark() {
    if (marks.isEmpty) {
      return 0.0; 
    }

    int sum = marks.reduce((value, element) => value + element);
    
    return sum / marks.length;
  }
}

void main() {
  
  Student student = Student("John", [85, 90, 75, 80, 95]);

  
  double averageMark = student.findAverageMark();
  print("Average Mark for ${student.name}: $averageMark");
}
