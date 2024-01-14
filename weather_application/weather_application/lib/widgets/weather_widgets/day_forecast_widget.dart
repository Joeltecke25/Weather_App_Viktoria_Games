import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/build_structure_widgets.dart';

class DayForecast extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const DayForecast({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    List<Map<String, dynamic>>? forecastDays =
        futureweatherData?['forecast']['forecastday'];

    String? tomorrowDay = forecastDays?[1]['date_epoch'];
    String? afterTomorrowDay = forecastDays?[2]['date_epoch'];

    String getDayOfWeek(String? epochTime) {
      if (epochTime != null) {
        DateTime date =
            DateTime.fromMillisecondsSinceEpoch(int.parse(epochTime) * 1000);
        List<String> daysOfWeek = [
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday',
          'Sunday'
        ];
        return daysOfWeek[date.weekday - 1];
      }
      return '';
    }

    String getTemperature(String? temperature) {
      return temperature ?? '';
    }

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
                  Icons.calendar_today_rounded,
                  '3-DAY FORECAST',
                ),
                const SizedBox(height: 16),
              ],
            ),
            Positioned(
              top: 90,
              right: 80,
              child: Row(
                children: [
                  buildTextWithSeparatorRight(
                    'Today',
                    Icons.wb_sunny,
                    getTemperature(
                        forecastDays?[0]['day']['maxtemp_c']?.toString()),
                  ),
                  const SizedBox(width: 20),
                  buildTextWithSeparatorRight(
                    getDayOfWeek(tomorrowDay),
                    Icons.wb_cloudy,
                    getTemperature(
                        forecastDays?[1]['day']['maxtemp_c']?.toString()),
                  ),
                  const SizedBox(width: 20),
                  buildTextWithoutSeparatorRight(
                    getDayOfWeek(afterTomorrowDay),
                    Icons.wb_sunny,
                    getTemperature(
                        forecastDays?[2]['day']['maxtemp_c']?.toString()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
