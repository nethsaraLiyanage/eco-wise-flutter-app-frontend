import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var progressBarWidth = size.width * 0.5;
    return Container(
      height: size.height * 0.088,
      width: size.width * 0.872,
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
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  width: progressBarWidth,
                  height: size.height * 0.015,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  width: progressBarWidth * 0.8,
                  height: size.height * 0.015,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 15, 173, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '80%',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
            )
          ],
        )
      ]),
    );
  }
}
