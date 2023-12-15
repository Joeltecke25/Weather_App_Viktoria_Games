import 'package:flutter/material.dart';
import 'package:weather_application/widgets/localization_info.dart';
import 'package:weather_application/widgets/back_button.dart';
import 'package:weather_application/widgets/ica_box.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});


  @override
  Widget build(BuildContext context) {
    const TextStyle temperatureTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 45,
      decoration: TextDecoration.none,
    );

    const TextStyle numberTextStyle = TextStyle(
      color: Colors.white,
      fontSize: 230,
      decoration: TextDecoration.none,
    );

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 37, 152, 247),
                  Color.fromARGB(255, 253, 140, 47),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: const Stack(
              alignment: Alignment.topCenter,
              children: [
                LocationInfoWidget(),
                Row(
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
                  'Temperature',
                  style: temperatureTextStyle,
                ),
                Text(
                  '9º',
                  style: numberTextStyle,
                ),
                IcaWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}