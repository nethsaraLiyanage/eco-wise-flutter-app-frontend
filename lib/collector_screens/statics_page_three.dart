import 'package:flutter/material.dart';

class StaticsPageThree extends StatefulWidget {
  const StaticsPageThree({super.key});

  @override
  State<StaticsPageThree> createState() => _StaticsPageThreeState();
}

class _StaticsPageThreeState extends State<StaticsPageThree> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/statimg06.png',
              fit: BoxFit.fill,
            ),
          ),
          
        ],
      ),
    );
  }
}
