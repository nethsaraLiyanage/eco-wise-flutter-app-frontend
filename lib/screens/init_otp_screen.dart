import 'package:flutter/material.dart';

import 'package:eco_wise/screens/log_in_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/otp_container.dart';

class InitOTPScreen extends StatelessWidget {
  final num_1 = TextEditingController();
  final num_2 = TextEditingController();
  final num_3 = TextEditingController();
  final num_4 = TextEditingController();
  final String mobileNumber;
  final String otp;

  InitOTPScreen({
    super.key,
    required this.mobileNumber,
    required this.otp,
  });

  void _onTryAgain(BuildContext context) async {
    // send same as previuos screen
    Navigator.of(context).pop();
  }

  void _onNext(BuildContext context) {
    // send user typed number
    var enteredOtp = num_1.text + num_2.text + num_3.text + num_4.text;
    if (enteredOtp == otp) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => LogInScreen(),
        ),
        (route) => false,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('OTP does not match! Try Again'),
          duration: Duration(milliseconds: 500),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //ToDo: Notification Icon with notification counter
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'Please enter the 4- Digit code provided via sms or call to',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 20),
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '+94*********',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 20),
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Change',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          color: const Color.fromARGB(255, 255, 91, 91),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 75),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //ToDo: Make the otp container to take only a single digit
                  OTPContainer(digitController: num_1),
                  OTPContainer(digitController: num_2),
                  OTPContainer(digitController: num_3),
                  OTPContainer(digitController: num_4),
                ],
              ),
            ),
            const SizedBox(height: 65),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Didn't get the code?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 20),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.topLeft,
                      ),
                      onPressed: () => _onTryAgain(context),
                      child: Text(
                        'Try Again',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 20,
                              color: const Color.fromARGB(255, 255, 91, 91),
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                CustomElevatedButton(
                  onButtonPressed: () {
                    _onNext(context);
                  },
                  height: 56,
                  width: 134,
                  childWidget: Text(
                    "Next",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
