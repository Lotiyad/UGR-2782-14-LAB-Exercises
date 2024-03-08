import 'dart:async';
import 'dart:math';


Future<String> fetchRandomQuote() async {
 
  await Future.delayed(Duration(seconds: 2));


  List<String> quotes = [
    "The only way to do great work is to love what you do. - Steve Jobs",
    "Innovation distinguishes between a leader and a follower. - Steve Jobs",
    "Stay hungry, stay foolish. - Steve Jobs",
    "Your time is limited, don’t waste it living someone else’s life. - Steve Jobs"
  ];

  
  int index = Random().nextInt(quotes.length);

 
  return quotes[index];
}

void main() async {
  
  String quote = await fetchRandomQuote();


  print("Random Quote: $quote");
}
