import 'package:flutter/material.dart';

class WindSpeed extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const WindSpeed({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double? windSpeedKph =
        futureweatherData?['current']['wind_kph']?.toDouble();

    double rightPosition = 370; //Wind Speed = 0

    if (windSpeedKph != null) {
      if (windSpeedKph > 0 && windSpeedKph <= 10) {
        rightPosition = 320;
      } else if (windSpeedKph > 10 && windSpeedKph <= 20) {
        rightPosition = 270;
      } else if (windSpeedKph > 20 && windSpeedKph <= 30) {
        rightPosition = 220;
      } else if (windSpeedKph > 30 && windSpeedKph <= 40) {
        rightPosition = 170;
      } else if (windSpeedKph > 40 && windSpeedKph <= 50) {
        rightPosition = 120;
      } else if (windSpeedKph > 50 && windSpeedKph <= 60) {
        rightPosition = 70;
      } else if (windSpeedKph > 60) {
        rightPosition = 35;
      }
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 230,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
                  child: Column(
                    children: [
                      Text(
                        'Wind speed',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      "$windSpeedKph km/h", // Display wind speed
                      style: const TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Container(
                    width: screenWidth - 150,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.blue,
                          Colors.indigo,
                          Colors.purple,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 147,
              right: rightPosition,
              child: const Icon(
                Icons.circle,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
