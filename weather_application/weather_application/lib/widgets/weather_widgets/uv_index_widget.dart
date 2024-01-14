import 'package:flutter/material.dart';

class UvIndexWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const UvIndexWidget({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Accessing UV index data from the API response
    int? uvIndex = futureweatherData?['current']['uv'].toInt();

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
                  Text(
                    'UV index',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    uvIndex?.toString() ?? '', // Display UV index value
                    style: TextStyle(
                      fontSize: 60,
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
                width: screenWidth - 200,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      Colors.green,
                      Colors.yellow,
                      Colors.orange,
                      Colors.red,
                      Colors.purple,
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 46,
              right: 220,
              child: Icon(
                Icons.wb_sunny,
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
