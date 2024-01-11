import 'dart:math';
import 'package:flutter/material.dart';

class WindDirection extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const WindDirection({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing wind speed and direction values from the API data
    double? windDirectionDegree =
        futureweatherData?['current']['wind_degree']?.toDouble();

    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 400,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Text(
                'Wind direction',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          width: 10,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 190, 190, 190),
                              width: 6,
                            ),
                          ),
                          child: Center(
                            child: Transform.rotate(
                              angle: (windDirectionDegree ?? 0) * pi / 180,
                              child: const Icon(
                                Icons.arrow_right_alt,
                                color: Color.fromARGB(255, 255, 255, 255),
                                size: 180,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 14,
                      right: 139,
                      child: Text(
                        'N',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 250,
                      right: 142,
                      child: Text(
                        'S',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 132,
                      right: 23,
                      child: Text(
                        'E',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 132,
                      left: 18,
                      child: Text(
                        'W',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
