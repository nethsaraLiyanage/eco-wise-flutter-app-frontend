import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:eco_wise/widgets/custom_elevated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/double_circle.png',
            alignment: Alignment.center,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 70),
                Text(
                  'Welcome!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: const Color.fromARGB(255, 20, 220, 0),
                        fontSize: 55,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Recycle, refresh, reimagine',
                  style: TextStyle(
                    fontFamily: GoogleFonts.crimsonText.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Let\'s e-waste the right way',
                  style: TextStyle(
                    fontFamily: GoogleFonts.crimsonText.toString(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                CustomElevatedButton(
                  onButtonPressed: () {},
                  height: 59,
                  width: 275,
                  childWidget: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
