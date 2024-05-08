import 'package:eco_wise/screens/rate_screen.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  void _onTap(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => RateScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _onTap(context),
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
