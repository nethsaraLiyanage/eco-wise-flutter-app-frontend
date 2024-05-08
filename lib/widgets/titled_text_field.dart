import 'package:flutter/material.dart';

class TitledTextField extends StatelessWidget {
  final TextEditingController localController;
  final String title;
  final double height;
  final double width;
  final bool isPw;

  const TitledTextField({
    super.key,
    required this.localController,
    required this.title,
    required this.height,
    required this.width,
    required this.isPw,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 7,
          ),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 242, 242),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            obscureText: isPw,
            controller: localController,
            decoration: const InputDecoration(border: InputBorder.none),
          ),
        ),
      ],
    );
  }
}
