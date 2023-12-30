import 'package:flutter/material.dart';

class VisibilityBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const VisibilityBox({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
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
          const SizedBox(height: 8),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: const LinearProgressIndicator(
                  value: 10 / 12.0,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  backgroundColor: Color.fromARGB(255, 221, 221, 221),
                  minHeight: 50,
                ),
              ),
              Center(
                child: Text(
                  "${10.round()}km",
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
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
