import 'package:flutter/material.dart';

class SunsetWidget extends StatelessWidget {
  final String sunsetTime; // Format: "18:03"

  const SunsetWidget({Key? key, required this.sunsetTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      decoration: BoxDecoration(
        color: const Color.fromARGB(100, 207, 207, 207),
        borderRadius: BorderRadius.circular(20),
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
              SizedBox(width: 8),
              Text(
                "Sunset",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          AnimatedSun(sunsetTime: sunsetTime),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Sunrise",
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 221, 221, 221),
                ),
              ),
              SizedBox(width: 8),
              // You can add the sunrise time here
              Text(
                "07:11",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AnimatedSun extends StatefulWidget {
  final String sunsetTime;

  const AnimatedSun({Key? key, required this.sunsetTime}) : super(key: key);

  @override
  _AnimatedSunState createState() => _AnimatedSunState();
}

class _AnimatedSunState extends State<AnimatedSun>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    // Trigger animation on widget creation
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(
        Icons.wb_sunny,
        color: Colors.yellow,
        size: 70,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedSun oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Trigger animation when the sunset time changes
    if (oldWidget.sunsetTime != widget.sunsetTime) {
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
