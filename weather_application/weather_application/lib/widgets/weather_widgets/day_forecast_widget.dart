import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/build_structure_widgets.dart';

class DayForecast extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const DayForecast({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: screenWidth - 62,
        height: 280,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                buildRowWithIconAndText(
                    Icons.calendar_today_rounded, '3-DAY FORECAST'),
                const SizedBox(height: 16),
              ],
            ),
            Positioned(
              top: 90,
              right: 80,
              child: Row(
                children: [
                  buildTextWithSeparatorRight('Today', Icons.wb_sunny, '10º'),
                  const SizedBox(width: 20),
                  buildTextWithSeparatorRight(
                      'Tuesday', Icons.wb_cloudy, '12º'),
                  const SizedBox(width: 20),
                  buildTextWithoutSeparatorRight(
                      'Wednesday', Icons.wb_sunny, '15º'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
