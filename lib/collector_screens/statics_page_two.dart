import 'package:flutter/material.dart';

class StaticsPageTwo extends StatefulWidget {
  const StaticsPageTwo({super.key});

  @override
  State<StaticsPageTwo> createState() => _StaticsPageTwoState();
}

class _StaticsPageTwoState extends State<StaticsPageTwo> {
  
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
