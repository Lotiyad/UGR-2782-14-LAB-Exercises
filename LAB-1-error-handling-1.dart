import 'dart:io';

void main() {

  print("Enter a number:");

  
  String input = stdin.readLineSync()!;

  try {
    
    int number = int.parse(input);

    
    print("Integer value: $number");
  } catch (e) {
   
    print("Error: Invalid input. Please enter a valid number.");
  }
}
