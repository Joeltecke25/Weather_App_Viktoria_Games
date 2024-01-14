import 'package:flutter/material.dart';

class HourForecastWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const HourForecastWidget({super.key, required this.futureweatherData});

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
    List<dynamic>? hourlyForecast =
        futureweatherData?['forecast']['forecastday'][0]['hour'];

    if (hourlyForecast == null || hourlyForecast.isEmpty) {
      return Container();
    }

    Map<String, dynamic> hourData = hourlyForecast[index];
    String hour = hourData['time'] ?? '';

    DateTime hourDateTime = DateTime.parse(hour);
    String formattedHour = '${hourDateTime.hour}:00';

    String condition = hourData['condition']['text'] ?? '';
    double temperature = (hourData['temp_c'] as num?)?.toDouble() ?? 0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          index == 0 ? 'Now' : formattedHour,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        getWeatherIcon(condition),
        const SizedBox(height: 8),
        Text(
          '$temperatureº',
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
        return const Icon(Icons.wb_sunny_outlined,
            size: 40, color: Colors.white);
      case 'Cloudy':
        return const Icon(Icons.cloud_outlined, size: 40, color: Colors.white);
      case 'Rainy':
        return const Icon(Icons.grain_outlined, size: 40, color: Colors.white);
      case 'Snowy':
        return const Icon(Icons.ac_unit_outlined,
            size: 40, color: Colors.white);
      default:
        return const Icon(Icons.help, size: 40, color: Colors.black);
    }
  }
}
