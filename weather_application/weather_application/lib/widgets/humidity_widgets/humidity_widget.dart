import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const HumidityWidget({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int? avgHumidity =
        futureweatherData?['forecast']['forecastday'][0]['day']['avghumidity'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 300,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 16, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 70),
                  Text(
                    "$avgHumidity%",
                    style: const TextStyle(
                      fontSize: 90,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 60,
              right: 50,
              child: Container(
                width: screenWidth - 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(172, 99, 98, 98),
                ),
              ),
            ),
            Positioned(
              top: 110,
              right: 50,
              child: Container(
                width: screenWidth - 350,
                height: 150,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  color: Color.fromARGB(172, 48, 48, 48),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
