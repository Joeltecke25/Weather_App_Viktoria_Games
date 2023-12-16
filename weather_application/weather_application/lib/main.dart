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

  Map<String, dynamic>? futureweatherData;
  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  Map<String, dynamic>? currentWeatherData;
  bool currentisLoading = true;
  bool currenthasError = false;
  String currenterrorMessage = '';

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
          futureweatherData = json.decode(response.body);
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

  Future<void> fetchCurrentWeatherData() async {
    final String currentApiUrl =
        'https://weatherapi-com.p.rapidapi.com/current.json?q=$city';

    try {
      final response = await http.get(
        Uri.parse(currentApiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        setState(() {
          currentWeatherData = json.decode(response.body);
        });
      } else {
        print('Error ${response.statusCode}: ${response.body}');
        handleApiError(response.statusCode);
      }
    } catch (error) {
      print('Error: $error');
      setState(() {
        currentisLoading = false;
        currenthasError = true;
        currenterrorMessage =
            'Error fetching current weather data. Please try again.';
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
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : hasError
              ? Center(
                  child: Text(errorMessage),
                )
              : TempScreen(
                  weatherData: futureweatherData,
                ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: TempApp(), // Pass the initial value as needed
  ));
}
