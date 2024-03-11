import 'package:eco_wise/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/titled_text_field.dart';
import 'package:eco_wise/screens/welcome_screen.dart';

class LogInScreen extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onSignUp() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => SignUpScreen(),
        ),
      );
    }

    void onLogIn(BuildContext context) {
      //ToDo: Username, Password authentication
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => const WelcomeScreen(),
          ),
          (route) => false);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitledTextField(
                localController: _usernameController,
                title: 'Username',
                height: 49,
                width: 337,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TitledTextField(
                    localController: _passwordController,
                    title: 'Password',
                    height: 49,
                    width: 337,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 5, 5),
                          ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 46),
              CustomElevatedButton(
                onButtonPressed: () {
                  onLogIn(context);
                },
                height: 54,
                width: 275,
                childWidget: Text(
                  'Continue',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              const SizedBox(height: 80),
              SizedBox(
                height: 49,
                width: 337,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/google.png'),
                      Text(
                        'Continue with Google',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 67),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                  const SizedBox(width: 8),
                  TextButton(
                    onPressed: onSignUp,
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 255, 91, 91),
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
