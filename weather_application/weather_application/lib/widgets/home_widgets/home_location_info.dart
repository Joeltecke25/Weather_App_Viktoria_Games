import 'package:flutter/material.dart';

class LocationInfoHomeWidget extends StatelessWidget {

  const LocationInfoHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Barcelona',
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Spain | 14:33',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}