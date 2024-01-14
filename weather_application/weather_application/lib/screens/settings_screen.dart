import 'package:flutter/material.dart';
import 'package:weather_application/widgets/settings_widgets/settings_temp_widget.dart';
import 'package:weather_application/widgets/settings_widgets/settings_speed_widget.dart';
import 'package:weather_application/widgets/settings_widgets/settings_notifications_widget.dart';
import 'package:weather_application/widgets/settings_widgets/blue_back_button.dart';

class SettingsScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;
  const SettingsScreen({super.key, required this.futureweatherData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 236, 235, 235),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 90,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 139, 139, 139),
                    offset: Offset(0, 0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              child: const Row(
                children: [
                  GoBackButtonBlue(),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Color.fromARGB(255, 76, 196, 190),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 60,
            left: MediaQuery.of(context).size.width / 2 - 40,
            child: const Text(
              'Settings',
              style: TextStyle(
                color: Color.fromARGB(255, 76, 196, 190),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 150,
            left: 25,
            child: Text(
              "TEMPERATURE UNIT",
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 175,
            left: 0,
            child: SettingsTemperature(),
          ),
          const Positioned(
            top: 300,
            left: 25,
            child: Text(
              "SPEED UNIT",
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 325,
            left: 0,
            child: SettingsSpeed(),
          ),
          const Positioned(
            top: 450,
            left: 25,
            child: Text(
              "NOTIFICATIONS",
              style: TextStyle(
                color: Color.fromARGB(255, 114, 114, 114),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 475,
            left: 0,
            child: SettingsNotifications(),
          ),
        ],
      ),
    );
  }
}
