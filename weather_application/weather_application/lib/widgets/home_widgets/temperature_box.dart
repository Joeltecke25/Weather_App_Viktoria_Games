import 'package:flutter/material.dart';

class TemperatureBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const TemperatureBox({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing temperature and feels like values from the API data
    double? currentTempC = futureweatherData?['current']['temp_c']?.toDouble();
    double? feelsLikeC =
        futureweatherData?['current']['feelslike_c']?.toDouble();

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
                Icons.thermostat,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Temperature",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "$currentTempC°", // Display temperature
            style: const TextStyle(fontSize: 70, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Feels Like",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 221, 221, 221)),
              ),
              const SizedBox(width: 8),
              Text(
                "$feelsLikeC°", // Display feels like temperature
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
