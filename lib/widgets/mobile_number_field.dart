import 'package:flutter/material.dart';

class MobileNumberField extends StatelessWidget {
  final TextEditingController numberController;

  const MobileNumberField({
    super.key,
    required this.numberController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(20),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset('assets/images/slflag.png'),
              ),
              const SizedBox(width: 10),
              const Text(
                '+94',
              ),
              const SizedBox(width: 10),
              const VerticalDivider(
                thickness: 2,
                color: Colors.black,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter your mobile number here',
                      hintStyle: TextStyle(fontSize: 14)),
                  controller: numberController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
