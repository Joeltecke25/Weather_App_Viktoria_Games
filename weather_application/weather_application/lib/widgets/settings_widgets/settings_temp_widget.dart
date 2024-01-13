import 'package:flutter/material.dart';

class SettingsTemperature extends StatelessWidget {
  const SettingsTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25),
            child: Text(
              'Unit',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25),
            child: Text(
              'Celsius (ºC)',
              style: TextStyle(
                color: Color.fromARGB(255, 180, 180, 180),
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
