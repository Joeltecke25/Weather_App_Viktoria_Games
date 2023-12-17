import 'package:flutter/material.dart';
import 'package:weather_application/widgets/localization_info.dart';
import 'package:weather_application/widgets/back_button.dart';
import 'package:weather_application/widgets/ica_box.dart';
import 'package:weather_application/widgets/temperature_info.dart';
import 'package:weather_application/widgets/prediction_widget.dart';

class TempScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  final Map<String, dynamic>? currentWeatherData;

  const TempScreen(
      {Key? key,
      required this.futureweatherData,
      required this.currentWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle temperatureTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 40,
      decoration: TextDecoration.none,
    );

    const TextStyle numberTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 200,
      decoration: TextDecoration.none,
    );

    String? temperature = futureweatherData?['current']['temp_c']?.toString();
    String? maxtemp = futureweatherData?['forecast']['forecastday'][0]['day']
            ['maxtemp_c']
        ?.toString();
    String? mintemp = futureweatherData?['forecast']['forecastday'][0]['day']
            ['mintemp_c']
        ?.toString();
    String? feelsLike =
        futureweatherData?['current']['feelslike_c']?.toString();

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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GoBackButton(),
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
                  'Temperature',
                  style: temperatureTextStyle,
                ),
                Text(
                  '$temperatureº',
                  style: numberTextStyle,
                ),
                IcaWidget(futureweatherData: futureweatherData),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoRow('Max ', '$maxtempº', Colors.white, Colors.red),
                    SizedBox(width: 25),
                    InfoRow('Min ', '$mintempº', Colors.white, Colors.blue),
                    SizedBox(width: 25),
                    InfoRow('Feels like ', '$feelsLikeº', Colors.white,
                        Color.fromARGB(255, 58, 58, 58)),
                  ],
                ),
                const SizedBox(height: 20),
                const PredictionBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
