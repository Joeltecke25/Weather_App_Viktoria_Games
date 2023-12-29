import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  final Color labelColor;
  final Color valueColor;

  const InfoRow(this.label, this.value, this.labelColor, this.valueColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: labelColor, fontSize: 22),
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
              color: valueColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ],
    );
  }
}
