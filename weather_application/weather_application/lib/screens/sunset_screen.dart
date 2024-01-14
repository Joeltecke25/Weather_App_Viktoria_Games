import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/localization_info.dart';
import 'package:weather_application/widgets/general_widgets/back_button.dart';
import 'package:weather_application/widgets/sunset_widgets/sunrise_widget.dart';
import 'package:weather_application/widgets/sunset_widgets/sunset_widget.dart';

class SunsetScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const SunsetScreen({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle sunsetTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 40,
      decoration: TextDecoration.none,
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 153, 255),
                  Color.fromARGB(255, 255, 135, 37),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                LocationInfoWidget(futureweatherData: futureweatherData),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GoBackButton(futureweatherData: futureweatherData),
                  ],
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 110.0),
            child: Column(
              children: [
                const Text(
                  'Sunset',
                  style: sunsetTextStyle,
                ),
                SunsetWidget(futureweatherData: futureweatherData),
                const SizedBox(height: 8),
                SunriseWidget(futureweatherData: futureweatherData),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
