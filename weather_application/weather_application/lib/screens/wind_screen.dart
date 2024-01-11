import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/localization_info.dart';
import 'package:weather_application/widgets/general_widgets/back_button.dart';
import 'package:weather_application/widgets/wind_widgets/wind_speed.dart';
import 'package:weather_application/widgets/wind_widgets/wind_direction.dart';


class WindScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const WindScreen({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    const TextStyle windTextStyle = TextStyle(
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
            child: const Column(
              children: [
                Text(
                  'Wind',
                  style: windTextStyle,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    WindSpeed(),
                    SizedBox(height: 20,),
                    WindDirection(),
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
