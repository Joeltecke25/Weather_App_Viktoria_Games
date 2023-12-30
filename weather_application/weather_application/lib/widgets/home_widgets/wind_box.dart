import 'dart:math';
import 'package:flutter/material.dart';

class WindBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const WindBox({Key? key, required this.futureweatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing wind speed and direction values from the API data
    double? windSpeedKph =
        futureweatherData?['current']['wind_kph']?.toDouble();
    double? windDirectionDegree =
        futureweatherData?['current']['wind_degree']?.toDouble();

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
            child: Transform.rotate(
              angle: (windDirectionDegree ?? 0) *
                  pi /
                  180, // Convert degrees to radians
              child: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 90,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.air,
                    color: Colors.white,
                    size: 20,
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Wind",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "$windSpeedKph km/h", // Display wind speed
                    style: TextStyle(fontSize: 26, color: Colors.white),
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
