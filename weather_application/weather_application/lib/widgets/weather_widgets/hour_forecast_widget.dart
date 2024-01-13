import 'package:flutter/material.dart';
import 'dart:math';

class HourForecastWidget extends StatelessWidget {
  const HourForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 160,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            7,
            (index) => buildHourColumn(index),
          ),
        ),
      ),
    );
  }

  Widget buildHourColumn(int index) {
    Random random = Random();
    List<String> conditions = ['Sunny', 'Cloudy', 'Rainy', 'Snowy'];
    String randomCondition = conditions[random.nextInt(conditions.length)];
    int randomTemperature = random.nextInt(15) + 5;

    DateTime now = DateTime.now();
    DateTime nextHour = now.add(Duration(hours: index));
    String hour = '${nextHour.hour}:00';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          index == 0 ? 'Now' : hour,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        getWeatherIcon(randomCondition),
        const SizedBox(height: 8),
        Text(
          '$randomTemperatureº',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Icon getWeatherIcon(String condition) {
    switch (condition) {
      case 'Sunny':
        return const Icon(Icons.wb_sunny_outlined, size: 40, color: Colors.white);
      case 'Cloudy':
        return const Icon(Icons.cloud_outlined, size: 40, color: Colors.white);
      case 'Rainy':
        return const Icon(Icons.grain_outlined, size: 40, color: Colors.white);
      case 'Snowy':
        return const Icon(Icons.ac_unit_outlined, size: 40, color: Colors.white);
      default:
        return const Icon(Icons.help, size: 40, color: Colors.black);
    }
  }
}
