import 'package:flutter/material.dart';

class IcaWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const IcaWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? aqi = futureweatherData?['current']['air_quality']['us-epa-index']
            ?.toString() ??
        'N/A';

    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.eco,
              color: Colors.green,
            ),
          ),
          Center(
            child: Text(
              'ICA $aqi',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
