import 'package:flutter/material.dart';

class SunsetWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const SunsetWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing sunset data from the API response
    Map<String, dynamic>? astronomyData =
        futureweatherData?['forecast']['forecastday'][0]['astro'];
    String? sunsetTimeString = astronomyData?['sunset'];

    // Custom parsing method for the specific format
    DateTime? sunsetTime;
    if (sunsetTimeString != null) {
      sunsetTime = parseTimeString(sunsetTimeString);
    }

    // Check if current time is greater than sunset time
    if (sunsetTime != null && DateTime.now().isAfter(sunsetTime)) {
      // If yes, use the sunset time of the next day
      sunsetTime = sunsetTime.add(Duration(days: 1));
    }

    // Calculating time remaining until sunset
    Duration timeRemaining =
        sunsetTime?.difference(DateTime.now()) ?? const Duration();

    // Displaying hours and minutes remaining
    String remainingHours =
        timeRemaining.inHours.remainder(24).toString().padLeft(2, '0');
    String remainingMinutes =
        timeRemaining.inMinutes.remainder(60).toString().padLeft(2, '0');

    // Displaying the sunset hour
    String sunsetHour = sunsetTime?.hour.toString().padLeft(2, '0') ?? '00';
    String sunsetMinute = sunsetTime?.minute.toString().padLeft(2, '0') ?? '00';

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.deepPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.wb_twilight,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Sunset Time',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          Text(
            '$sunsetHour:$sunsetMinute',
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
          const SizedBox(height: 8),
          const Text(
            "Time Remaining",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            '$remainingHours:$remainingMinutes',
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Custom parsing method for the specific time format
  DateTime? parseTimeString(String timeString) {
    try {
      List<String> timeParts = timeString.split(':');
      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1].split(' ')[0]);

      // Determining whether it's AM or PM
      if (timeString.contains('PM')) {
        hours += 12;
      }
      return DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, hours, minutes);
    } catch (e) {
      print("Error parsing time string: $e");
      return null;
    }
  }
}
