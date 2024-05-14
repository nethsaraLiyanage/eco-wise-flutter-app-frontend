import 'package:eco_wise/collector_screens/col_map_screen.dart';
import 'package:flutter/material.dart';

import 'package:eco_wise/models/pickUp_model.dart';

class ColScheduleScreen extends StatefulWidget {
  const ColScheduleScreen({super.key});

  @override
  State<ColScheduleScreen> createState() => _ColScheduleScreenState();
}

class _ColScheduleScreenState extends State<ColScheduleScreen> {
  final _pickUps = [
    PickUp(
      name: 'Oshada Nanayakkara',
      category: 'Laptop Deive',
      quantity: 1,
      isSchedule: true,
      time: DateTime(2024, 05, 07, 10, 00),
    ),
    PickUp(
      name: 'Shasheni Mendis',
      category: 'Laptop Deive',
      quantity: 1,
      isSchedule: true,
      time: DateTime(2024, 05, 07, 10, 30),
    ),
    PickUp(
      name: 'Dinura Kularathne',
      category: 'Mobile Phone',
      quantity: 1,
      isSchedule: true,
      time: DateTime(2024, 05, 07, 11, 30),
    ),
    PickUp(
      name: 'Sanuvi Sonnadara',
      category: 'Washing Machine',
      quantity: 1,
      isSchedule: true,
      time: DateTime(2024, 05, 07, 13, 30),
    ),
    PickUp(
      name: 'Sanuvi Sonnadara',
      category: 'Washing Machine',
      quantity: 1,
      isSchedule: true,
      time: DateTime(2024, 05, 07, 19, 00),
    ),
  ];
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate() async {
    DateTime? _date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );

    if (_date != null) {
      setState(() {
        selectedDate = _date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pickup Details',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      const Icon(Icons.filter_list),
                      Text(
                        'Galle',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: _selectDate,
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Text(
                        '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.grey),
                      ),
                      const Icon(Icons.filter_list),
                    ],
                  ),
                ),
              )
            ],
          ),
          ..._pickUps
              .map((e) => ListTile(
                    title: Text(
                      'Name: ${e.name}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Category: ${e.category}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          'Quantity: ${e.quantity}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                        ),
                        Text(
                          'Time: ${e.time?.hour}:${e.time?.minute}',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => ColMapScreen(
                            name: e.name,
                          ),
                        ),
                      );
                    },
                  ))
              .toList()
        ],
      ),
    );
  }
}
