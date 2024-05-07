import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/mobile_number_field.dart';
import 'package:eco_wise/screens/init_otp_screen.dart';

class InitMobileNumberScreen extends StatelessWidget {
  const InitMobileNumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final numberController = TextEditingController();

    void sendOTP(TextEditingController numberController) async {
      if (numberController.text.length > 9 ||
          numberController.text.length < 9 ||
          numberController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Enter 9 Digit Number in the format 771234567'),
          ),
        );
      } else {
        // final response = await http.post(
        //   Uri.parse(''),
        //   headers: <String, String>{
        //     'Content-Type': 'application/json; charset=UTF-8',
        //   },
        //   body: jsonEncode(
        //       <String, String>{'mobileNumber': numberController.text}),
        // );

        // if (response.statusCode == 400) {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('Something went wrong! Please try again'),
        //       duration: Duration(milliseconds: 500),
        //     ),
        //   );
        // } else {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //       content: Text('OTP Sent'),
        //       duration: Duration(milliseconds: 500),
        //     ),
        //   );

        //   Navigator.of(context).push(
        //     MaterialPageRoute(
        //       builder: (ctx) => InitOTPScreen(
        //         mobileNumber: numberController.text,
        //       ),
        //     ),
        //   );
        // }
      }
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => InitOTPScreen(
            mobileNumber: numberController.text,
          ),
        ),
      );
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
