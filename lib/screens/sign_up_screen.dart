import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final _fullName = TextEditingController();
  final _address = TextEditingController();
  final _postalCode = TextEditingController();
  final _province = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  //ToDo: Input validation and sign in functionality
  void _signIn(){
    if(_fullName.text.isEmpty){
      //Input validation
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
                  //ToDo: Child might change to a different image if user entered a dp
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
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _address,
                      labelText: 'Address',
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _postalCode,
                      labelText: 'Postal Code',
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _province,
                      labelText: 'Province',
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _email,
                      labelText: 'Email',
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _password,
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 26),
                    CustomTextField(
                      customController: _confirmPassword,
                      labelText: 'Confirm Password',
                    ),
                  ],
                ),
                const SizedBox(
                  height: 47,
                ),
                CustomElevatedButton(
                    onButtonPressed: _signIn,
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
