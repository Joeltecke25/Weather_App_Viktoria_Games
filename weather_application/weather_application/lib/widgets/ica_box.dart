import 'package:flutter/material.dart';

class IcaWidget extends StatelessWidget {
  const IcaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 6,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 139, 139, 139),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}