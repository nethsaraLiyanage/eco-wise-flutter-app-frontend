import 'package:flutter/material.dart';

class OTPContainer extends StatelessWidget {
  final TextEditingController digitController;

  const OTPContainer({super.key, required this.digitController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 55,
      width: 57,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(fontSize: 14),
        ),
        controller: digitController,
      ),
    );
  }
}
