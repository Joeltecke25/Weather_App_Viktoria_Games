import 'package:flutter/material.dart';
import 'package:weather_application/screens/visibility_screen.dart';
import 'package:weather_application/screens/weather_screen.dart';
import 'package:weather_application/screens/temperature_screen.dart';
import 'package:weather_application/screens/wind_screen.dart';
import 'package:weather_application/screens/sunset_screen.dart';
import 'package:weather_application/screens/humidity_screen.dart';
import 'package:weather_application/screens/settings_screen.dart';
import 'package:weather_application/widgets/home_widgets/home_location_info.dart';
import 'package:weather_application/widgets/home_widgets/temperature_box.dart';
import 'package:weather_application/widgets/home_widgets/weather_box.dart';
import 'package:weather_application/widgets/home_widgets/wind_box.dart';
import 'package:weather_application/widgets/home_widgets/humidity_box.dart';
import 'package:weather_application/widgets/home_widgets/visibility_box.dart';
import 'package:weather_application/widgets/home_widgets/sunset_box.dart';

class HomeScreen extends StatelessWidget {
  final Map<String, dynamic>? futureweatherData;

  const HomeScreen({super.key, required this.futureweatherData});

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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsScreen(
                        futureweatherData: futureweatherData,
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.settings, color: Colors.white),
              ),
            ),
            Positioned(
              top: 40.0,
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: LocationInfoHomeWidget(futureweatherData: futureweatherData),
            ),
            Positioned(
              top: 200.0,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WeatherScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: WeatherBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TempScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: TemperatureBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WindScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: WindBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HumidityScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: HumidityBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SunsetScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: SunsetBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VisibilityScreen(
                                    futureweatherData: futureweatherData),
                              ),
                            );
                          },
                          child: VisibilityBox(
                            futureweatherData: futureweatherData,
                          ),
                        ),
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
