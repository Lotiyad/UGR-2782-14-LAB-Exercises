import 'dart:async';


Future<List<String>> loadDataFromDatabase() async {

  await Future.delayed(Duration(seconds: 2));


  List<String> data = ['Data 1', 'Data 2', 'Data 3', 'Data 4', 'Data 5'];

 
  return data;
}

void main() async {
  
  List<String> loadedData = await loadDataFromDatabase();

 
  print('Loaded Data: $loadedData');
}
