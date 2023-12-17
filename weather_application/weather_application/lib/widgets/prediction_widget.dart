import 'package:flutter/material.dart';

class PredictionBox extends StatelessWidget {
  const PredictionBox({Key? key}) : super(key: key);

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildTextWithSeparator('7-DAY FORECAST'),
            buildTextWithSeparator('Today'),
            buildTextWithSeparator('Tue'),
            buildTextWithSeparator('Wed'),
            buildTextWithSeparator('Thu'),
            buildTextWithSeparator('Fri'),
            buildTextWithSeparator('Sat'),
            buildTextWithoutSeparator('Sun'),
          ],
        ),
      ),
    );
  }

  Widget buildTextWithSeparator(String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        if (text != 'Sun')
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget buildTextWithoutSeparator(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 14, bottom: 14),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}