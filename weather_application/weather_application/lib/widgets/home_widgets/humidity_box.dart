import 'package:flutter/material.dart';

class HumidityBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const HumidityBox({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing humidity and pressure values from the API data
    int? humidity = futureweatherData?['current']['humidity']?.toInt();
    double? pressureMb =
        futureweatherData?['current']['pressure_mb']?.toDouble();

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
                Icons.opacity,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Humidity",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "$humidity%", // Display humidity
            style: const TextStyle(fontSize: 50, color: Colors.white),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Pressure",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 221, 221, 221),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "$pressureMb mb", // Display pressure
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
