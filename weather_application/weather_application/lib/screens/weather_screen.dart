import 'package:flutter/material.dart';
import 'package:weather_application/widgets/weather_widgets/day_forecast_widget.dart';
import 'package:weather_application/widgets/weather_widgets/hour_forecast_widget.dart';
import 'package:weather_application/widgets/general_widgets/localization_info.dart';
import 'package:weather_application/widgets/general_widgets/back_button.dart';
import 'package:weather_application/widgets/weather_widgets/uv_index_widget.dart';
import 'package:weather_application/widgets/weather_widgets/cloud_cover_widget.dart';

class WeatherScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const WeatherScreen({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    const TextStyle weatherTextStyle = TextStyle(
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
                Text(
                  'Weather',
                  style: weatherTextStyle,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HourForecastWidget(
                        futureweatherData:
                            futureweatherData), //Falta cambio con la API
                    UvIndexWidget(futureweatherData: futureweatherData),
                    CloudCoverWidget(futureweatherData: futureweatherData),
                    DayForecast(futureweatherData: futureweatherData),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
