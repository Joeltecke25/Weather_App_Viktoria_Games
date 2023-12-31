import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/build_structure_widgets.dart';

class PredictionBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const PredictionBox({
    Key? key,
    required this.futureweatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    String getWeekdayName(int weekday) {
      switch (weekday) {
        case 1:
          return 'Mon  ';
        case 2:
          return 'Tue    ';
        case 3:
          return 'Wed  ';
        case 4:
          return 'Thu   ';
        case 5:
          return 'Fri     ';
        case 6:
          return 'Sat    ';
        case 7:
          return 'Sun   ';
        default:
          return '';
      }
    }

    double? minTempDay0 = futureweatherData?['forecast']['forecastday'][0]
            ['day']['mintemp_c']
        ?.toDouble();
    double? maxTempDay0 = futureweatherData?['forecast']['forecastday'][0]
            ['day']['maxtemp_c']
        ?.toDouble();
    double? minTempDay1 = futureweatherData?['forecast']['forecastday'][1]
            ['day']['mintemp_c']
        ?.toDouble();
    double? maxTempDay1 = futureweatherData?['forecast']['forecastday'][1]
            ['day']['maxtemp_c']
        ?.toDouble();
    double? minTempDay2 = futureweatherData?['forecast']['forecastday'][2]
            ['day']['mintemp_c']
        ?.toDouble();
    double? maxTempDay2 = futureweatherData?['forecast']['forecastday'][2]
            ['day']['maxtemp_c']
        ?.toDouble();
    String? weekdayDay1 =
        futureweatherData?['forecast']['forecastday'][1]['date_epoch'] != null
            ? getWeekdayName(
                DateTime.fromMillisecondsSinceEpoch(
                        futureweatherData?['forecast']['forecastday'][1]
                                ['date_epoch'] *
                            1000)
                    .toLocal()
                    .weekday,
              )
            : null;

    String? weekdayDay2 =
        futureweatherData?['forecast']['forecastday'][2]['date_epoch'] != null
            ? getWeekdayName(
                DateTime.fromMillisecondsSinceEpoch(
                        futureweatherData?['forecast']['forecastday'][2]
                                ['date_epoch'] *
                            1000)
                    .toLocal()
                    .weekday,
              )
            : null;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: screenWidth - 32,
        height: 420,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildRowWithIconAndText(
                Icons.calendar_today_rounded, '3-DAY FORECAST'),
            const SizedBox(height: 16),
            buildTextWithSeparator('Today', '$minTempDay0º', '$maxTempDay0º'),
            buildTextWithSeparator(
                '$weekdayDay1', '$minTempDay1º', '$maxTempDay1º'),
            buildTextWithoutSeparator(
                '$weekdayDay2', '$minTempDay2º', '$maxTempDay2º'),
          ],
        ),
      ),
    );
  }
}
