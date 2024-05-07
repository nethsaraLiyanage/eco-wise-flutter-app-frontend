import 'package:flutter/material.dart';

import 'package:eco_wise/models/user_model.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  // get all users from backend
  final topUsers = [
    EcoWiseUser(
      name: 'Oshadha',
      points: 4000,
      rank: 2,
      profileImage: 'assets/images/dp.png',
      isTopUser: true,
      color: Colors.orange,
    ),
    EcoWiseUser(
      name: 'Shasheni',
      points: 5000,
      rank: 1,
      profileImage: 'assets/images/dp.png',
      isTopUser: true,
      color: Colors.green,
    ),
    EcoWiseUser(
      name: 'Sanuvi',
      points: 3000,
      rank: 3,
      profileImage: 'assets/images/dp.png',
      isTopUser: true,
      color: Colors.red,
    ),
  ];

  final otherUsers = [
    EcoWiseUser(
      name: 'Chethana Perera',
      points: 2000,
      rank: 4,
      profileImage: 'assets/images/dp.png',
      isTopUser: false,
      color: Colors.green,
    ),
    EcoWiseUser(
      name: 'Mahima Perera',
      points: 1000,
      rank: 5,
      profileImage: 'assets/images/dp.png',
      isTopUser: false,
      color: Colors.green,
    ),
    EcoWiseUser(
      name: 'Dinura Kularathne',
      points: 500,
      rank: 6,
      profileImage: 'assets/images/dp.png',
      isTopUser: false,
      color: Colors.green,
    ),
    EcoWiseUser(
      name: 'Samudi Abegunawardane',
      points: 400,
      rank: 7,
      profileImage: 'assets/images/dp.png',
      isTopUser: false,
      color: Colors.green,
    ),
  ];

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
                      color: const Color.fromARGB(255, 237, 237, 237),
                    ),
                    child: Row(
                      children: [],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: topUsers
                        .map(
                          (e) => Column(
                            children: [
                              Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  SizedBox(
                                    width: e.rank == 1 ? 100 : 70,
                                    height: e.rank == 1 ? 100 : 70,
                                    child: Image.asset(
                                      e.profileImage,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    height: 20,
                                    width: 20,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: e.color,
                                    ),
                                    child: Text(
                                      e.rank.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Text(e.name),
                              Text(e.points.toString())
                            ],
                          ),
                        )
                        .toList(),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ...otherUsers.map(
                    (e) => ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${e.rank}th',
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Image.asset(
                            e.profileImage,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                      title: Text(e.name),
                      subtitle: Text(e.points.toString()),
                    ),
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
