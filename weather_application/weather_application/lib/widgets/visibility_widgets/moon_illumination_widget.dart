import 'package:flutter/material.dart';

class MoonWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const MoonWidget({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int? moonIllumination = futureweatherData?['forecast']['forecastday'][0]
        ['astro']['moon_illumination'];

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 130,
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
                    'Moon Illumination',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "$moonIllumination%",
                    style: const TextStyle(
                      fontSize: 38,
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
                width: screenWidth - 230,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 46, 46, 46),
                      Color.fromARGB(255, 255, 222, 172),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            const Positioned(
              top: 46,
              right: 220,
              child: Icon(
                Icons.nightlight_round,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
