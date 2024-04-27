import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void _onTryAgain() {
      {
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/error.png'),
            Text(
              'Something went wrong',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
            ),
            Text(
              'Someone else has scheduled your time',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: _onTryAgain,
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 253, 33, 33)),
              child: Text(
                'TRY AGAIN',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.white,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
