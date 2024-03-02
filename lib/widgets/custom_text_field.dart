import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.customController,
    required this.labelText,
  });

  final TextEditingController customController;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49,
      width: 347,
      padding: const EdgeInsets.only(left: 15),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 217, 217),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        controller: customController,
      ),
    );
  }
}
