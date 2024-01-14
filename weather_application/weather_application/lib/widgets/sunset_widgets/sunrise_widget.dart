import 'package:flutter/material.dart';

class SunriseWidget extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const SunriseWidget({Key? key, required this.futureweatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Accessing sunrise data from the API response
    Map<String, dynamic>? astronomyData =
        futureweatherData?['forecast']['forecastday'][0]['astro'];
    String? sunriseTimeString = astronomyData?['sunrise'];

    // Custom parsing method for the specific format
    DateTime? sunriseTime;
    if (sunriseTimeString != null) {
      sunriseTime = parseTimeString(sunriseTimeString);
    }

    // Check if current time is greater than sunrise time
    if (sunriseTime != null && DateTime.now().isAfter(sunriseTime)) {
      // If yes, use the sunrise time of the next day
      sunriseTime = sunriseTime.add(const Duration(days: 1));
    }

    // Calculating time remaining until sunrise
    Duration timeRemaining =
        sunriseTime?.difference(DateTime.now()) ?? const Duration();

    // Displaying hours and minutes remaining
    String remainingHours =
        timeRemaining.inHours.remainder(24).toString().padLeft(2, '0');
    String remainingMinutes =
        timeRemaining.inMinutes.remainder(60).toString().padLeft(2, '0');

    // Displaying the sunrise hour
    String sunriseHour = sunriseTime?.hour.toString().padLeft(2, '0') ?? '00';
    String sunriseMinute =
        sunriseTime?.minute.toString().padLeft(2, '0') ?? '00';

    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.orange],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.wb_twilight,
                color: Colors.white,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Sunrise Time',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          Text(
            '$sunriseHour:$sunriseMinute',
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
      // ignore: avoid_print
      print("Error parsing time string: $e");
      return null;
    }
  }
}
