import 'package:flutter/material.dart';

class SunsetBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const SunsetBox({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing sunset and sunrise times from the API data
    String? sunsetTime =
        futureweatherData?['forecast']['forecastday'][0]['astro']['sunset'];
    String? sunriseTime =
        futureweatherData?['forecast']['forecastday'][0]['astro']['sunrise'];

    return Container(
    height: 180,
    width: 180,
    decoration: BoxDecoration(
      color: const Color.fromARGB(100, 207, 207, 207),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(
              Icons.wb_twilight,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              "Sunset",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "$sunsetTime", // Display sunset time
          style: const TextStyle(fontSize: 30, color: Colors.white),
        ),
        const SizedBox(height: 15),
        const SizedBox(
          height: 30,
          child: Center(
            child: Icon(
              Icons.wb_sunny,
              color: Color.fromARGB(255, 71, 71, 71),
              size: 30,
            ),
          ),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Sunrise",
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 221, 221, 221),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              "$sunriseTime", // Display sunrise time
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ],
    ),
  );
  }
}
