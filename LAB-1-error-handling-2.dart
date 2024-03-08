double divide(double numerator, double denominator) {
  try {
    
    return numerator / denominator;
  } catch (e) {
    
    if (e is DivisionByZeroError) {
      print("Error: Division by zero is not allowed.");
    } else {
     
      print("Error: An unexpected error occurred.");
    }
    return double.nan;
  }
}

void main() {
  
  double result1 = divide(10, 2); 
  print("Result 1: $result1");

  double result2 = divide(10, 0); 
  print("Result 2: $result2"); 
}
