import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 343,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        border: Border.all(),
        boxShadow: const [
          BoxShadow(blurRadius: 2, offset: Offset(0, 2), color: Colors.black54)
        ],
      ),
      child: Column(children: [
        const SizedBox(height: 18),
        Text(
          'Your laptop device is still in recycle process',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
        )
      ]),
    );
  }
}
