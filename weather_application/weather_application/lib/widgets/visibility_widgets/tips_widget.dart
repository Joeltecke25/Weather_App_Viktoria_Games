import 'package:flutter/material.dart';

class TipsWidget extends StatelessWidget {
  const TipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Container(
        width: screenWidth - 62,
        height: 320,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              const Text(
                'TIPS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Optimal conditions: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Ideal for driving, astronomical observation, and landscape photography.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Key caution: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Despite good visibility, remain prudent outdoors, especially while driving.',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Color.fromARGB(255, 48, 48, 48),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: 'Health impact: ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Consider how visibility affects air quality for individuals with respiratory conditions.',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
