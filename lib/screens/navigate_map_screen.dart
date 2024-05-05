import 'package:flutter/material.dart';

class NavigateMapScreen extends StatefulWidget {
  const NavigateMapScreen({super.key});

  @override
  State<NavigateMapScreen> createState() => _NavigateMapScreenState();
}

class _NavigateMapScreenState extends State<NavigateMapScreen> {
  void _onBack() {}

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: _onBack,
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              width: size.width * 0.895,
              height: size.height * 0.376,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  Text(
                    'Our pickup agent is on the way',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
