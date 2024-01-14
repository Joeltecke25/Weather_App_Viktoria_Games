import 'package:flutter/material.dart';
import 'package:weather_application/screens/home_screen.dart';

class GoBackButtonBlue extends StatelessWidget {
  const GoBackButtonBlue({super.key, required this.futureweatherData});
  final Map<String, dynamic>? futureweatherData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    HomeScreen(futureweatherData: futureweatherData),
              ),
            );
          },
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
                color: Color.fromARGB(255, 76, 196, 190),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
