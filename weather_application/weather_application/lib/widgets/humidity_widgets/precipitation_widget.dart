import 'package:flutter/material.dart';

class PrecipitationWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const PrecipitationWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? totalPrecipitationMM = futureweatherData?['forecast']['forecastday'][0]['day']['totalprecip_mm'];
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Stack(
        children: [
          Center(
            child: Text(
              "$totalPrecipitationMM",
              style: const TextStyle(
                fontSize: 70,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 100,
            left: 30,
            right: 0,
            child: Text(
              "mm",
              style: TextStyle(
                fontSize: 50,
                color: Colors.white,
              ),
            ),
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Precipitation",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}