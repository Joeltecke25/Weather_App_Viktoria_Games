import 'package:flutter/material.dart';

class TemperatureBox extends StatelessWidget {
  const TemperatureBox({super.key});

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
                Icons.thermostat,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                "Temperature",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            "9º",
            style: TextStyle(fontSize: 70, color: Colors.white),
          ),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Feels Like",
                style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 221, 221, 221)),
              ),
              SizedBox(width: 8),
              Text(
                "7º",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
