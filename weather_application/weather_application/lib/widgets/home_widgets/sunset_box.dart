import 'package:flutter/material.dart';

class SunsetBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const SunsetBox({super.key, required this.futureweatherData});

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_twilight,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Sunset",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "18:03",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sunrise",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 221, 221, 221)),
              ),
              SizedBox(width: 8),
              Text(
                "07:11",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
