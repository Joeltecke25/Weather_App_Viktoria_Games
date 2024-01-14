import 'package:flutter/material.dart';

class RainWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const RainWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? chanceOfRain = futureweatherData?['forecast']['forecastday'][0]
        ['day']['daily_chance_of_rain'];
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
            top: 40,
            left: 0,
            right: 0,
            child: Text(
              "$chanceOfRain%",
              style: const TextStyle(
                fontSize: 65,
                color: Colors.white,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chance of Rain",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
