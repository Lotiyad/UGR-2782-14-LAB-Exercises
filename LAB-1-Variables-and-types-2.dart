void main() {
 
  const int speedOfLight = 299792458; 

 
  print("Enter the distance (in meters):");
  int distance = int.parse(stdin.readLineSync()!);

 
  double time = distance / speedOfLight;

 
  print("Time taken for light to travel $distance meters: $time seconds");
}
