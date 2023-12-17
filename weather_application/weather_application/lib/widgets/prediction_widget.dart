import 'package:flutter/material.dart';

class PredictionBox extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  PredictionBox({
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
            buildTextWithSeparator(
                '$weekdayDay2', '$minTempDay2º', '$maxTempDay2º'),
          ],
        ),
      ),
    );
  }

  Widget buildRowWithIconAndText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextWithSeparator(
      String text, String additionalText1, String additionalText2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 30, top: 14, bottom: 14, right: 30),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  additionalText1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 5,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
                Text(
                  additionalText2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (text != 'Sun')
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget buildTextWithoutSeparator(
      String text, String additionalText1, String additionalText2) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 14, bottom: 14, right: 30),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              additionalText1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Text(
              additionalText2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
