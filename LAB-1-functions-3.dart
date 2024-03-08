String reverseString(String input) {
 
  return input.split('').reversed.join('');
}

void main() {
  String originalString = "Hello, World!";
  

  String reversedString = reverseString(originalString);
  print("Original string: $originalString");
  print("Reversed string: $reversedString");
}
