import 'package:flutter/material.dart';

class PressureWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const PressureWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double? pressureMB = futureweatherData?['forecast']['forecastday'][0]
        ['hour'][0]['pressure_mb'];
    return Container(
      height: 180,
      width: screenWidth - 62,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Center(
            child: Text(
              "$pressureMB mb",
              style: const TextStyle(
                fontSize: 70,
                color: Colors.white,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pressure",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
