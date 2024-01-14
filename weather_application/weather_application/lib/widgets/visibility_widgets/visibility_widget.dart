import 'package:flutter/material.dart';

class VisibilityWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const VisibilityWidget({super.key, required this.futureweatherData});

  @override
Widget build(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  String? visibility = futureweatherData?['current']['vis_km']?.toString();
  double? avgVisibility = futureweatherData?['forecast']['forecastday'][0]['day']['avgvis_km']?.toDouble();

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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              'Visibility',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: screenWidth - 150,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey,
              ),
              child: Center(
                child: Text(
                  "$visibility km",
                  style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                children: [
                  const TextSpan(
                    text: 'Average Visibility  ',
                  ),
                  TextSpan(
                    text: '$avgVisibility km',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 73, 73, 73),
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
