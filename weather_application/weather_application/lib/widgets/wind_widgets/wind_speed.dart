import 'package:flutter/material.dart';

class WindSpeed extends StatelessWidget {
  const WindSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 230,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
              child: Row(
                children: [
                  Text(
                    'Wind Speed',
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
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  '9.2 km/h',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Container(
                width: screenWidth - 150,
                height: 10,
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
      ),
    );
  }
}