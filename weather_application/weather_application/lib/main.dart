import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TempScreen extends StatefulWidget {
  const TempScreen({Key? key}) : super(key: key);

  @override
  _TempScreenState createState() => _TempScreenState();
}

class _TempScreenState extends State<TempScreen> {
  // Replace 'YOUR_API_KEY' with your actual API key
  final String apiKey = '4c4fd46742msh181fec80b59613ep1a3301jsn22e6ca3acd5d';

  // Replace 'CITY_NAME' and 'COUNTRY_CODE' with the city and country for which you want the forecast
  final String city = 'Barcelona';
  final String country = 'Spain';

  // Number of days of forecast required (between 1 and 14)
  final int days = 5;

  // Weather data
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final String apiUrl =
        'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$city&days=$days';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
        });
      } else {
        print('Error ${response.statusCode}: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: weatherData != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Temperature: ${weatherData!['current']['temp_c']}°C'),
                  // Add more widgets to display additional weather information
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TempScreen(),
  ));
}
