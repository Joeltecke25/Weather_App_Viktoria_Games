import 'package:flutter/material.dart';
import 'package:weather_application/screens/home_screen.dart';

class GoBackButton extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const GoBackButton({Key? key, required this.futureweatherData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(futureweatherData: futureweatherData),
              ),
            );
          },
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back_rounded,
                size: 50,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ],
          ),
        ),
      ),
    );
  }
}