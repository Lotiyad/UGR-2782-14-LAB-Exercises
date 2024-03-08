import 'dart:math';

void main() {
  
  List<int> numbers = List.generate(20, (_) => Random().nextInt(20));

  
  print("Original List: $numbers");

  
  Set<int> uniqueNumbers = numbers.toSet();

 
  print("Unique Numbers: $uniqueNumbers");
}
