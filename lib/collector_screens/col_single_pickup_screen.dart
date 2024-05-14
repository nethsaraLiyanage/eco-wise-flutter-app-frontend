import 'package:eco_wise/collector_screens/col_map_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ColSinglePickUpScreen extends StatefulWidget {
  ColSinglePickUpScreen({
    super.key,
    required this.name,
    required this.category,
    required this.qty,
    this.time,
    required this.isScheduled,
  });

  final String name;
  final String category;
  final int qty;
  DateTime? time;
  final bool isScheduled;

  @override
  State<ColSinglePickUpScreen> createState() => _ColSinglePickUpScreenState();
}

class _ColSinglePickUpScreenState extends State<ColSinglePickUpScreen> {
  final time = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset('assets/images/home_dp.png'),
            ),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Image.asset('assets/images/pickup_icon.png'),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Pickup',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    children: [
                      Text(
                        widget.isScheduled
                            ? ''
                            : '${time.year}/${time.month}/${time.day}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      Text(
                        widget.isScheduled ? '' : '${time.hour}:${time.minute}',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              height: size.height * 0.162,
              width: size.width * 0.951,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[300],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Category: ${widget.category}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    'Quantity: ${widget.qty}',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                  Text(
                    'Address: 273, Colombo Road, Galle.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
              onButtonPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ColMapScreen(
                      name: widget.name,
                    ),
                  ),
                );
              },
              height: 48,
              width: 146,
              childWidget: Text(
                'Pickup',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
