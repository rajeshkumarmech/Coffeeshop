import 'package:flutter/material.dart';

class coffeenames extends StatelessWidget {
  final String coffeevariety;
  final bool isselected;
  final tap;

  coffeenames({
    required this.coffeevariety,
    required this.isselected,
    required this.tap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          coffeevariety,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isselected
                  ? Color.fromARGB(138, 105, 240, 175)
                  : Colors.limeAccent),
        ),
      ),
    );
  }
}
