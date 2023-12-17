import 'package:flutter/material.dart';

class LocationInfoWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const LocationInfoWidget({
    Key? key,
    required this.futureweatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? namecity = futureweatherData?['location']['name']?.toString();
    String? namecountry = futureweatherData?['location']['name']?.toString();
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
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              decoration: TextDecoration.none,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '$namecountry | $currentHour | GMT+1',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    );
  }
}
