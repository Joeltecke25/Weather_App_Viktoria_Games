import 'package:flutter/material.dart';
import 'package:weather_application/widgets/home_widgets/home_location_info.dart';
import 'package:weather_application/widgets/home_widgets/temperature_box.dart';
import 'package:weather_application/widgets/home_widgets/weather_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 0, 153, 255),
              Color.fromARGB(255, 255, 135, 37),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 20.0,
              right: 20.0,
              child: IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 40.0,
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: const LocationInfoHomeWidget(),
            ),
            Positioned(
              top: 200.0,
              width: MediaQuery.of(context).size.width,
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WeatherBox(),
                        SizedBox(width: 16),
                        TemperatureBox(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
