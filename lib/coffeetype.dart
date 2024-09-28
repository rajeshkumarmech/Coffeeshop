import 'package:flutter/material.dart';

class coffeetype extends StatelessWidget {
  final String coffeename;
  final bool selected;
  final VoidCallback ontap;

  coffeetype({
    required this.coffeename,
    required this.selected,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          coffeename,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: selected ? Colors.green : Colors.yellowAccent),
        ),
      ),
    );
  }
}
