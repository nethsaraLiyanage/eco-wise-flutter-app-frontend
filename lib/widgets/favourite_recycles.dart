import 'package:flutter/material.dart';

import 'package:eco_wise/models/recycle_location_model.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';

class FavouriteRecycles extends StatefulWidget {
  const FavouriteRecycles({
    super.key,
    required this.recycleLocations,
  });

  final List<RecycleLocation> recycleLocations;

  @override
  State<FavouriteRecycles> createState() => _NewRecycleState();
}

class _NewRecycleState extends State<FavouriteRecycles> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (cyx, constraints) {
      return SizedBox(
        // height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ...widget.recycleLocations
                    .map((e) => SizedBox(
                          child: Column(
                            children: [
                              ListTile(
                                leading: const Icon(Icons.location_pin),
                                title: Text(e.title),
                                subtitle: Text(e.address),
                              ),
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  const Icon(
                                    Icons.call_rounded,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(e.contactNumber)
                                ],
                              ),
                              const Divider(
                                thickness: 2,
                              )
                            ],
                          ),
                        ))
                    .toList(),
                const SizedBox(
                  height: 16,
                ),
                CustomElevatedButton(
                  onButtonPressed: () {},
                  height: 50,
                  width: 178,
                  childWidget: Text(
                    'Recycle',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
