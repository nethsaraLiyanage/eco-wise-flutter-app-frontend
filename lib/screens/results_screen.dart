import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Results',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 18, 220, 0),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 220, 0),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: Stack(
          children: [
            SizedBox(
              height: size.height * 0.89,
              width: double.infinity,
              child: Image.asset(
                'assets/images/results_back.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Leaderboard',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                          ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width * 0.895,
                    height: size.height * 0.062,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 237, 237, 237)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
