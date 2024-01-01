import 'package:flutter/material.dart';

class WeatherBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const WeatherBox({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    String? currentWeatherCondition =
        futureweatherData?['current']['condition']['text']?.toString();

    Map<String, IconData> weatherIcons = {
      'Clear': Icons.wb_sunny,
      'Partly cloudy': Icons.wb_cloudy,
      'Cloudy': Icons.cloud,
      'Overcast': Icons.cloud_queue,
      'Mist': Icons.cloud_circle,
    };

    IconData? weatherIcon = weatherIcons[currentWeatherCondition];

    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Icon(
              weatherIcon ?? Icons.cloud_outlined,
              color: Colors.white,
              size: 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    weatherIcon ?? Icons.cloud_download,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Weather",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "$currentWeatherCondition",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
