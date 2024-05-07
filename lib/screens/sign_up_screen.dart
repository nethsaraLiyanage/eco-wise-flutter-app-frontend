import 'dart:convert';

import 'package:eco_wise/screens/error_screen.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/custom_text_field.dart';
import 'package:eco_wise/screens/welcome_screen.dart';
import 'package:eco_wise/config/config.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _fullName = TextEditingController();
  final _address = TextEditingController();
  final _postalCode = TextEditingController();
  final _province = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  void _signIn(BuildContext context) async {
    if (_password.text != _confirmPassword.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Entered passwords does not match'),
        ),
      );
    } else {
      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
        final response = await http.post(
          Uri.parse('${apiUrl}users/register'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            "username": _fullName.text,
            "addess": _address.text,
            "postalCode": _postalCode.text,
            "email": _email.text,
            "password": _password.text,
          }),
        );

        print('Response Stat: ${response.statusCode}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => const WelcomeScreen(),
              ),
              (route) => false);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ErrorScreen(),
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Email and Password are compulsory'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.all(5),
                  child: Image.asset('assets/images/dp.png'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Create Your Profile',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                const SizedBox(height: 36),
                Column(
                  children: [
                    CustomTextField(
                      customController: _fullName,
                      labelText: 'Full Name',
                      isPw: false,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _address,
                      labelText: 'Address',
                      isPw: false,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _postalCode,
                      labelText: 'Postal Code',
                      isPw: false,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _province,
                      labelText: 'Province',
                      isPw: false,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _email,
                      labelText: 'Email',
                      isPw: false,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _password,
                      labelText: 'Password',
                      isPw: true,
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _confirmPassword,
                      labelText: 'Confirm Password',
                      isPw: true,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 47,
                ),
                CustomElevatedButton(
                    onButtonPressed: () {
                      _signIn(context);
                    },
                    height: 54,
                    width: 275,
                    childWidget: Text(
                      'Sign In',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
