import 'package:flutter/material.dart';

class PredictionBox extends StatelessWidget {
  const PredictionBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: screenWidth - 32,
        height: 420,
        decoration: BoxDecoration(
          color: const Color.fromARGB(100, 207, 207, 207),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            buildRowWithIconAndText(Icons.calendar_today_rounded, '7-DAY FORECAST'),
            const SizedBox(height: 16),
            buildTextWithSeparator('Today', '7º', '12º'),
            buildTextWithSeparator('Tue', '6º', '10º'),
            buildTextWithSeparator('Wed', '7º', '11º'),
            buildTextWithSeparator('Thu', '9º', '14º'),
            buildTextWithSeparator('Fri', '9º', '13º'),
            buildTextWithSeparator('Sat', '7º', '12º'),
            buildTextWithoutSeparator('Sun', '10º', '14º'),
          ],
        ),
      ),
    );
  }

  Widget buildRowWithIconAndText(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextWithSeparator(String text, String additionalText1, String additionalText2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 14, bottom: 14, right: 30),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  additionalText1,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  height: 5,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.red],
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                ),
                Text(
                  additionalText2,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (text != 'Sun')
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            height: 1,
            width: double.infinity,
            color: Colors.white,
          ),
      ],
    );
  }

  Widget buildTextWithoutSeparator(String text, String additionalText1, String additionalText2) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 14, bottom: 14, right: 30),
      child: Container(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              additionalText1,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              height: 5,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.red],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Text(
              additionalText2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}