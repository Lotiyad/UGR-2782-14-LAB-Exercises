import 'dart:math';


bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) {
      return false;
    }
  }
  return true;
}

void main() {
  int start = 1;
  int end = 50;

  print("Prime numbers between $start and $end are:");

 
  for (int i = start; i <= end; i++) {
    if (isPrime(i)) {
      print(i);
    }
  }
}
