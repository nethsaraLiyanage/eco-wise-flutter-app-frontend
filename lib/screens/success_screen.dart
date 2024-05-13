import 'package:eco_wise/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx) => HomeScreen(),
                    ),
                    (route) => false);
              },
              child: Image.asset('assets/images/success.png'),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Your time has been scheduled',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
