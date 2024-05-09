import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/titled_text_field.dart';
import 'package:eco_wise/screens/welcome_screen.dart';
import 'package:eco_wise/screens/sign_up_screen.dart';
import 'package:eco_wise/config/config.dart';
import 'package:eco_wise/providers/user_id_provider.dart';

class LogInScreen extends ConsumerWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LogInScreen({super.key});

  final storage = FlutterSecureStorage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onSignUp() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => SignUpScreen(),
        ),
      );
    }

    void onLogIn(BuildContext context) async {
      if (_usernameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty) {
        final response = await http.post(
          Uri.parse('${apiUrl}users/login'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            "email": _usernameController.text,
            "password": _passwordController.text,
          }),
        );
        print(response.statusCode);
        if (response.statusCode == 200) {
          // print(jsonDecode(response.body)['user']['_id']);

          final userId = jsonDecode(response.body)['user']['_id'];

          ref.read(userIdProvider.notifier).setUserId(userId);

          // await storage.write(key: "userId", value: userId);
          final id = ref.watch(userIdProvider);
          print(id);

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => const WelcomeScreen(),
              ),
              (route) => false);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please enter username and password'),
          ),
        );
      }
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
                isPw: false,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TitledTextField(
                    localController: _passwordController,
                    title: 'Password',
                    height: 49,
                    width: 337,
                    isPw: true,
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
