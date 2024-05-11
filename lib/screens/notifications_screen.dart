import 'dart:convert';

import 'package:eco_wise/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:eco_wise/models/notification_model.dart';
import 'package:eco_wise/providers/user_id_provider.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var myNotifications = [];

  final notifications = [
    LocalNotification(
      title: 'Recycling Tip of the Week',
      time: '1m',
      content:
          'Did you know? Recycleing one million laptop saves enough energy to power 3500 U.S homes for a year. Considerr recycling old devices today!',
      isRead: false,
    ),
    LocalNotification(
      title: 'Event Notification',
      time: '15m',
      content:
          'Join us this Saturday for a community e-waste recycling drive. Bring your old electronics and learn more about sustainable disposal practices.',
      isRead: false,
    ),
    LocalNotification(
      title: 'Policy Update',
      time: '1h',
      content:
          'Heads up! There\'s new update to the electronic waste managementment policy effective next month. Click here to learn what changes may affect you.',
      isRead: true,
    ),
    LocalNotification(
      title: 'Achivement Unlock',
      time: '6h',
      content:
          'Congratulations! You\'ve recycled 10 devices this year and earned a \'Green Champion\' badge. Keep up the good work!',
      isRead: true,
    ),
  ];

  void _markAsRead() {
    // post to back end to update isRead status
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notification',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              'assets/images/notification_background.png',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: _markAsRead,
                  child: Text(
                    'Mark as Read',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 255, 0, 0),
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: size.height * 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: notifications
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 25),
                              padding: const EdgeInsets.all(12),
                              width: double.infinity,
                              height: size.height * 0.124,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 4,
                                  )
                                ],
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        e.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                      ),
                                      Text(
                                        e.time,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: const Color.fromARGB(
                                                  255, 166, 166, 166),
                                            ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.78,
                                        child: Text(
                                          e.content,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      if (!e.isRead)
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Color.fromARGB(
                                                  255, 0, 86, 254)),
                                        )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: const Icon(
                          Icons.delete_outlined,
                          size: 40,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
