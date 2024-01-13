import 'package:flutter/material.dart';

class GoBackButtonBlue extends StatelessWidget {
  const GoBackButtonBlue({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.all(4),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
              color: Color.fromARGB(255, 76, 196, 190),
            ),
          ],
        ),
      ),
    );
  }
}