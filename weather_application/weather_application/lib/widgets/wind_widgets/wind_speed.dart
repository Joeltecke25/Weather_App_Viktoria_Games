import 'package:flutter/material.dart';
import 'package:weather_application/widgets/general_widgets/build_structure_widgets.dart';


class WindSpeed extends StatelessWidget {
  const WindSpeed({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: screenWidth - 32,
        height: 420,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}