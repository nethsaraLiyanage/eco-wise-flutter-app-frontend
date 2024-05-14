import 'package:eco_wise/collector_screens/statics_page_one.dart';
import 'package:eco_wise/collector_screens/statics_page_two.dart';
import 'package:flutter/material.dart';

import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/collector_screens/total_collected_items_screen.dart';

class ColProfileScreen extends StatelessWidget {
  const ColProfileScreen({super.key});

  void _onTap(String tappedOn, BuildContext context) {
    if (tappedOn == 'Total Collected Items') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => TotalCollectedItems(),
        ),
      );
    }
    if (tappedOn == 'Statics') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const StaticsPageOne(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final buttons = [
      'Settings',
      'Privacy Policy',
      'General',
      'Statics',
      'Total Collected Items',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.231,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset('assets/images/home_dp.png'),
                  ),
                  Text(
                    'Green Life Company',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomElevatedButton(
                    onButtonPressed: () {},
                    height: 40,
                    width: 133,
                    childWidget: Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: size.height * 0.342,
              width: size.width * 0.89,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 248, 248),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ...buttons
                      .map((e) => InkWell(
                            onTap: () {
                              _onTap(e, context);
                            },
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                      ),
                                      const Icon(Icons.navigate_next),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.75,
                                  child: const Divider(
                                    thickness: 2,
                                  ),
                                )
                              ],
                            ),
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
