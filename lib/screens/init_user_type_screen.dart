import 'package:flutter/material.dart';

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/screens/init_mobile_number_screen.dart';

class InitUserTypeScreen extends StatelessWidget {
  const InitUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onRecycler() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => InitMobileNumberScreen(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You are a',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                onButtonPressed: onRecycler,
                height: 56,
                width: 141,
                childWidget: Text(
                  'Recycler',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                ),
              ),
              const SizedBox(height: 15),
              CustomElevatedButton(
                onButtonPressed: () {},
                height: 56,
                width: 141,
                childWidget: Text(
                  'Collector',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
