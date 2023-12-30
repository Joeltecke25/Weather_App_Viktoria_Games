import 'package:flutter/material.dart';

class HumidityBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const HumidityBox({super.key, required this.futureweatherData});

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
                Icons.opacity,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Humidity",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "73%",
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Pressure ",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 221, 221, 221)),
              ),
              SizedBox(width: 8),
              Text(
                "1015mb",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
