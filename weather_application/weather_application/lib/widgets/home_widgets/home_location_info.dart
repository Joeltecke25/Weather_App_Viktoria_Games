import 'package:flutter/material.dart';

class LocationInfoHomeWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const LocationInfoHomeWidget({
    Key? key,
    required this.futureweatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? namecity = futureweatherData?['location']['name']?.toString();
    String? namecountry = futureweatherData?['location']['country']?.toString();
    String? currentHour =
        futureweatherData?['location']['localtime']?.toString();
    return Container(
      width: 300,
      height: 100,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$namecity',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 50,
              decoration: TextDecoration.none,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$namecountry | $currentHour',
            style: const TextStyle(
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
