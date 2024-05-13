import 'package:eco_wise/collector_screens/col_home_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColSuccessScreen extends StatelessWidget {
  const ColSuccessScreen({super.key});

  void _onBack(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ColHomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/col_ok.png'),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Your item has been picked up',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(
                height: 25,
              ),
              CustomElevatedButton(
                onButtonPressed: () {
                  _onBack(context);
                },
                height: 42,
                width: 138,
                childWidget: Text(
                  'Back',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
