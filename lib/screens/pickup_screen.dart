import 'package:flutter/material.dart';

import 'package:eco_wise/models/recycle_location_model.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/widgets/favourite_recycles.dart';
import 'package:eco_wise/screens/recycle_map_screen.dart';

class PickupScreen extends StatefulWidget {
  const PickupScreen({
    super.key,
    required this.isMobile,
  });

  final bool isMobile;
  @override
  State<PickupScreen> createState() => _PickupScreenState();
}

class _PickupScreenState extends State<PickupScreen> {
  String dropDownValue = 'Select Category';
  final quantityController = TextEditingController();
  final recycleLocations = [
    RecycleLocation(
      title: 'Greenn Life Dispoosal Company',
      address: '327, Wackwalla Road, Galle.',
      contactNumber: '077255718',
    ),
    RecycleLocation(
      title: 'Greenn Life Dispoosal Company',
      address: '327, Wackwalla Road, Galle.',
      contactNumber: '077255718',
    ),
    RecycleLocation(
      title: 'Greenn Life Dispoosal Company',
      address: '327, Wackwalla Road, Galle.',
      contactNumber: '077255718',
    ),
    RecycleLocation(
      title: 'Greenn Life Dispoosal Company',
      address: '327, Wackwalla Road, Galle.',
      contactNumber: '077255718',
    ),
  ];

  void _openFavouriteOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => FavouriteRecycles(
        recycleLocations: recycleLocations,
      ),
    );
  }

  void _onRecycle(BuildContext context) {
    if (quantityController.text.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => RecycleMapScreen(
              item: dropDownValue,
              qty: quantityController.text,
            ),
          ),
          (route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a category and enter the quantity'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Recycle Your Item',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.061,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Category',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  width: size.width * 0.784,
                  height: size.height * 0.061,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(255, 246, 246, 246),
                  ),
                  child: DropdownButton<String>(
                    value: widget.isMobile ? 'Mobile' : dropDownValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 124, 124, 124)),
                    underline: Container(height: 0),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropDownValue = newValue!;
                      });
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'Select Category',
                        child: Text('Select Category'),
                      ),
                      DropdownMenuItem(
                        value: 'Mobile',
                        child: Text('Mobile'),
                      ),
                      DropdownMenuItem(
                        value: 'Laptop',
                        child: Text('Laptop'),
                      ),
                      DropdownMenuItem(
                        value: 'TV',
                        child: Text('TV'),
                      ),
                      DropdownMenuItem(
                        value: 'Embedded items',
                        child: Text('Embedded items'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.041),
            SizedBox(
              width: size.width * 0.753,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Quantity',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                      ),
                      Text(
                        '${10} Points',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color.fromARGB(255, 124, 124, 124),
                            ),
                      ),
                    ],
                  ),
                  TextField(
                    controller: quantityController,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.061),
            SizedBox(
              width: size.width * 0.753,
              child: InkWell(
                onTap: _openFavouriteOverlay,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Icon(Icons.favorite_border),
                    Text(
                      'Favourites',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    const Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.081,
            ),
            CustomElevatedButton(
              onButtonPressed: () {
                _onRecycle(context);
              },
              height: 50,
              width: 178,
              childWidget: Text(
                'Recycle',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  SizedBox(
                    width: size.width,
                    child: Image.asset(
                      'assets/images/pick_arc_1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Image.asset(
                    'assets/images/pick_arc_2.png',
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
