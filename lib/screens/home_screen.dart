import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:eco_wise/models/tech_models.dart';
import 'package:eco_wise/widgets/custom_appbar.dart';
import 'package:eco_wise/widgets/progress_bar.dart';
import 'package:eco_wise/screens/pickup_screen.dart';
import 'package:eco_wise/screens/profile_screen.dart';
import 'package:eco_wise/screens/scan_screen.dart';
import 'package:eco_wise/screens/notifications_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var items = [
      Tech(name: 'Mobile', icon: Image.asset('assets/images/phone.png')),
      Tech(name: 'Laptop', icon: Image.asset('assets/images/laptop.png')),
      Tech(name: 'TV', icon: Image.asset('assets/images/tv.png')),
      Tech(name: 'Embedded', icon: Image.asset('assets/images/embedded.png')),
    ];

    var detailItems = [
      'assets/images/home_news.png',
      'assets/images/home_news.png',
      'assets/images/home_news.png',
    ];

    final navigationItems = [
      {
        'icon': 'assets/images/home_icon.png',
        'title': 'Home',
      },
      {
        'icon': 'assets/images/scan_icon.png',
        'title': 'Scan',
      },
      {'icon': 'assets/images/pickup_icon.png', 'title': 'Pickup'},
      {
        'icon': 'assets/images/profile_icon.png',
        'title': 'Profile',
      },
    ];

    void onNavigationBarTap(String title) {
      if (title == 'Profile') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const ProfileScreen(),
          ),
        );
      }
      if (title == 'Pickup') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const PickupScreen(),
          ),
        );
      }
      if (title == 'Scan') {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const ScanScreen(),
          ),
        );
      }
    }

    void onNotifications() {
      // getNotifications from the backend
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => NotificationsScreen(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height * 0.315,
            width: size.width,
            child: Image.asset(
              'assets/images/home_arc.png',
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                CustomAppBar(
                  onTap: onNotifications,
                ),
                SizedBox(height: size.height * 0.041),
                const ProgressBar(),
                SizedBox(height: size.height * 0.09),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        'Categories',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'See all',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                    ),
                          )),
                    )
                  ],
                ),
                SizedBox(height: size.height * 0.0246),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...items.map(
                      (e) => SizedBox(
                        width: e.icon.width,
                        child: Column(
                          children: [
                            e.icon,
                            Text(e.name),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                CarouselSlider(
                  items: detailItems
                      .map(
                        (e) => Builder(builder: (BuildContext context) {
                          return Container(
                            width: size.width,
                            height: size.height * 0.255,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Image.asset(
                              e,
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        }),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: size.height * 0.28,
                    enableInfiniteScroll: false,
                    initialPage: 0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.029),
                  width: size.width * 0.95,
                  height: size.height * 0.089,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 248, 247, 247),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(blurRadius: 3, color: Colors.grey)
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...navigationItems
                          .map(
                            (e) => InkWell(
                              onTap: () {
                                onNavigationBarTap(e['title']!);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(e['icon']!),
                                  Text(e['title']!),
                                ],
                              ),
                            ),
                          )
                          .toList()
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
