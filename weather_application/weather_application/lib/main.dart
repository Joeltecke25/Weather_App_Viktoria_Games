import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_application/screens/temperature_screen.dart';

class TempApp extends StatefulWidget {
  const TempApp({super.key});

  @override
  TempScreenState createState() => TempScreenState();
}

class TempScreenState extends State<TempApp> {
  final String apiKey = '1c4057f43dmshc4e277b6f25e4e6p14c4b6jsn61e03915c3e1';
  final String city = 'Madrid';
  final String country = 'Spain';
  final int days = 5;

  Map<String, dynamic>? weatherData;
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  Map<String, String> headers = {
    'X-RapidAPI-Key': 'YOUR_RAPIDAPI_KEY',
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
  };

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final String apiUrl =
        'https://weatherapi-com.p.rapidapi.com/forecast.json?q=$city&days=$days';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'X-RapidAPI-Key': apiKey,
          'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
          isLoading = false;
          hasError = false;
        });
      } else {
        // ignore: avoid_print
        print('Error ${response.statusCode}: ${response.body}');

        // Handle specific error codes
        handleApiError(response.statusCode);
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
      setState(() {
        isLoading = false;
        hasError = true;
        errorMessage = 'Error fetching data. Please try again.';
      });
    }
  }

  // Function to handle specific API error codes
  void handleApiError(int statusCode) {
    switch (statusCode) {
      case 401:
        errorMessage = 'API key not provided or invalid.';
        break;
      case 400:
        errorMessage = 'Invalid request. Check your parameters.';
        break;
      case 403:
        errorMessage =
            'API key has exceeded calls per month quota or has been disabled.';
        break;
      default:
        errorMessage = 'An error occurred. Please try again later.';
    }

    setState(() {
      isLoading = false;
      hasError = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : hasError
                ? Text(errorMessage)
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Temperature: Max ${weatherData!['forecast']['forecastday'][0]['day']['maxtemp_c']}°C, Min ${weatherData!['forecast']['forecastday'][0]['day']['mintemp_c']}°C',
                      ),
                    ],
                  ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TempScreen(),
  ));
}
