import 'dart:math';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/mobile_number_field.dart';
import 'package:eco_wise/screens/init_otp_screen.dart';

class InitMobileNumberScreen extends StatelessWidget {
  InitMobileNumberScreen({super.key});
  final random = Random();

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();

    void sendOTP(TextEditingController numberController) async {
      int r1 = random.nextInt(9);
      int r2 = random.nextInt(9);
      int r3 = random.nextInt(9);
      int r4 = random.nextInt(9);
      if (numberController.text.length > 9 ||
          numberController.text.length < 9 ||
          numberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter 9 Digit Number in the format 771234567'),
          ),
        );
      } else {
        final response = await http.post(
          Uri.parse(
              'https://app.notify.lk/api/v1/send?user_id=11730&api_key=x90sIZ90vLU23i0lm4pu&sender_id=NotifyDEMO&to=+94${numberController.text}&message= Your Eco-Wise OTP: $r1$r2$r3$r4'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('OTP Sent'),
              duration: Duration(milliseconds: 500),
            ),
          );

          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => InitOTPScreen(
                mobileNumber: numberController.text,
                otp: '$r1$r2$r3$r4',
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Something went wrong! Please try again'),
              duration: Duration(milliseconds: 500),
            ),
          );
        }
      }
      // print('$r1$r2$r3$r4');
      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //     builder: (ctx) => InitOTPScreen(
      //       mobileNumber: numberController.text,
      //       otp: '$r1$r2$r3$r4',
      //     ),
      //   ),
      // );
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  'Enter your mobile number. We\'ll text you a verification code.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MobileNumberField(
                numberController: numberController,
              ),
              const SizedBox(height: 90),
              CustomElevatedButton(
                onButtonPressed: () {
                  sendOTP(numberController);
                },
                height: 54,
                width: 275,
                childWidget: Text(
                  'Next',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
