import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherApp extends StatelessWidget {
  final String apiKey = 'TU_CLAVE_DE_API';
  final String ciudad = 'TuCiudad';

  const WeatherApp({super.key});

  Future<Map<String, dynamic>> obtenerDatos() async {
    final url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?id=3128760&appid=dec2ad672dc93aaa3ee95f13fe74b5d1');
    final respuesta = await http.get(url);

    if (respuesta.statusCode == 200) {
      // Decodifica la respuesta JSON
      return json.decode(respuesta.body);
    } else {
      // Maneja errores aquí
      throw Exception('Error al cargar los datos');
    }
  }

  // Documents\GitHub\Weather_App_Viktoria_Games\weather_application\weather_application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Weather App'),
        ),
        body: FutureBuilder(
          future: obtenerDatos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              // Aquí puedes trabajar con los datos obtenidos
              final datos = snapshot.data;
              return Center(
                child: Text('Temperatura: ${datos?['main']['temp']}'),
              );
            }
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const WeatherApp());
}
