import 'package:flutter/material.dart';

import 'package:eco_wise/models/item_model.dart';
import 'package:eco_wise/models/location_model.dart';

class TotalCollectedItems extends StatelessWidget {
  TotalCollectedItems({super.key});

  final items = [
    DeviceItem(
      title: 'Laptop Device',
      points: 70,
      date: DateTime.now(),
      qty: 50,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Tv',
      points: 100,
      date: DateTime.utc(2024, 2, 4),
      qty: 100,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Mobile Phone',
      points: 100,
      date: DateTime.utc(2024, 2, 2),
      qty: 75,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Mobile Phone',
      points: 150,
      date: DateTime.utc(2024, 2, 2),
      qty: 70,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Mobile Phone',
      points: 100,
      date: DateTime.utc(2024, 1, 28),
      qty: 150,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Embedded Items',
      points: 100,
      date: DateTime.utc(2024, 1, 22),
      qty: 50,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
    DeviceItem(
      title: 'Mobile Phone',
      points: 100,
      date: DateTime.utc(2024, 1, 10),
      qty: 200,
      userName: 'ABC',
      pickupLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      dropLocation: Location(
        title: 'Company',
        address: 'ABC',
        lat: 1.11,
        lon: 2.22,
        isFav: false,
      ),
      isScheduled: false,
      scheduledTime: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Total Collected Items',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.filter_list_sharp),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: items
              .map(
                (e) => SizedBox(
                  height: size.height * 0.12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              '${e.date.month}/${e.date.day}/${e.date.year} ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15,
                                    color: Colors.grey,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              width: size.width * 0.679,
                              child: const Divider(
                                thickness: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              e.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              'Quantity',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              e.qty.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
