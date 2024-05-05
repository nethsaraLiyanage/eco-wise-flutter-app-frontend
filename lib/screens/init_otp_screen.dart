import 'package:flutter/material.dart';

import 'package:eco_wise/screens/log_in_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/otp_container.dart';

class InitOTPScreen extends StatelessWidget {
  final num_1 = TextEditingController();
  final num_2 = TextEditingController();
  final num_3 = TextEditingController();
  final num_4 = TextEditingController();

  InitOTPScreen({super.key});

  void _onTryAgain(){
    // send same as previuos screen
  }

  void _onNext(){
    // send user typed number
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
                      onPressed: _onTryAgain,
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
                    var otp = num_1.text + num_2.text + num_3.text + num_4.text;
                    //ToDo: Validate OTP
                    print("The OTP is $otp");
                    //ToDo: if(validated){Navigate}
                    if (otp.isNotEmpty) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (ctx) => LogInScreen(),
                        ),
                        (route) => false,
                      );
                    }
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
