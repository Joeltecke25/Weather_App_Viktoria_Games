import 'package:flutter/material.dart';
import 'package:weather_application/widgets/localization_info.dart';
import 'package:weather_application/widgets/back_button.dart';
import 'package:weather_application/widgets/ica_box.dart';
import 'package:weather_application/widgets/temperature_info.dart';


class TempScreen extends StatelessWidget {
  final Map<String, dynamic>? weatherData;

  const TempScreen({Key? key, required this.weatherData}) : super(key: key);

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

    String? temperature = weatherData?['current']['temp_c']?.toString();

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
                const IcaWidget(),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InfoRow('Max ', '12º', Colors.white, Colors.red),
                    SizedBox(width: 25),
                    InfoRow('Min ', '7º', Colors.white, Colors.blue),
                    SizedBox(width: 25),
                    InfoRow('Feels like ', '7º', Colors.white, Color.fromARGB(255, 58, 58, 58)),
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
