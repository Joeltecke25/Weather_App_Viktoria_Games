import 'package:flutter/material.dart';
import 'package:weather_application/widgets/localization_info.dart';
import 'package:weather_application/widgets/back_button.dart';

class TempScreen extends StatelessWidget {
  const TempScreen({super.key});


  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}