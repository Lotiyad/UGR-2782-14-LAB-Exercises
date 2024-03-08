import 'dart:io';

void main() {
 
  print("Enter the file path:");

  
  String filePath = stdin.readLineSync()!;

  try {
    
    File file = File(filePath);
    List<String> lines = file.readAsLinesSync();

    
    print("File content:");
    lines.forEach((line) => print(line));
  } catch (e) {
    
    if (e is FileSystemException) {
      print("Error: ${e.message}");
    } else {
    
      print("Error: An unexpected error occurred.");
    }
  }
}
