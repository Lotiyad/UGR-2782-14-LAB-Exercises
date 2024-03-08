import 'dart:convert';
import 'package:http/http.dart' as http;


const String apiKey = 'YOUR_API_KEY';

Future<Map<String, dynamic>> fetchWeatherData(String cityName) async {
  final response = await http.get(
    Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric'),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load weather data');
  }
}

void main() async {
  try {
   
    final weatherData = await fetchWeatherData('London');

   
    final temperature = weatherData['main']['temp'];
    final weatherDescription = weatherData['weather'][0]['description'];

    
    print('Current Temperature: $temperature°C');
    print('Weather Conditions: $weatherDescription');
  } catch (e) {
    print('Error: $e');
  }
}
