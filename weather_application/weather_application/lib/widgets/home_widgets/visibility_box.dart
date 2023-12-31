import 'package:flutter/material.dart';

class VisibilityBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const VisibilityBox({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? visibility =
        futureweatherData?['forecast']['forecastday'][0]['day']['avgvis_km'];

    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.visibility,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Visibility",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: visibility! / 12.0,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 71, 71, 71)),
                  backgroundColor: Color.fromARGB(255, 143, 143, 143),
                  minHeight: 70,
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    "${visibility.round()} km",
                    style: const TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}