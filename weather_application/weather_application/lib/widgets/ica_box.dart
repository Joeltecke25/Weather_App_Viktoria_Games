import 'package:flutter/material.dart';

class IcaWidget extends StatelessWidget {
  const IcaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 177, 176, 176),
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Icon(
              Icons.eco,
              color: Colors.green,
            ),
          ),
          Center(
            child: Text(
              'ICA 42',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10), // Añadí un espacio entre el icono y el texto
        ],
      ),
    );
  }
}