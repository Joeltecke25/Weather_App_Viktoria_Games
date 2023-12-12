import 'package:flutter/material.dart';
import 'package:weather_application/widgets/localization_info.dart';

class TempScreen extends StatelessWidget{
  const TempScreen({super.key});

  @override
  Widget build (BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [
            Color.fromARGB(255, 15, 119, 205),
            Color.fromARGB(255, 1, 20, 40),
          ],
          radius: 1.0,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LocationInfoWidget(),
        ],
      ),
    );
  }
}