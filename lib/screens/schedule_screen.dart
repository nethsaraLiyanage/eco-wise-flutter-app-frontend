import 'package:flutter/material.dart';

import 'package:eco_wise/screens/schedule_map_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';

class ScheduleScreen extends StatelessWidget {
  ScheduleScreen({super.key});

  final yourScheduleLocation = TextEditingController();
  final dropScheduleLocation = TextEditingController();

  void _onNext(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => ScheduleMapScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule a Time',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'COLLECT',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: const Color.fromARGB(255, 0, 125, 12),
                        ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.595,
                  child: TextField(
                    controller: yourScheduleLocation,
                    decoration: const InputDecoration(
                      labelText: "Your Location",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    'DROP',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.595,
                  child: TextField(
                    controller: dropScheduleLocation,
                    decoration: const InputDecoration(
                      labelText: "Select Your Collector",
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              width: size.width * 0.89,
              child: InkWell(
                onTap: () {},
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
            const SizedBox(
              height: 25,
            ),
            CustomElevatedButton(
              onButtonPressed: () {
                _onNext(context);
              },
              height: 48,
              width: 108,
              childWidget: Text(
                'Next',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 10,
              width: double.infinity,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 20,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.house,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Add Home',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 20,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.work,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Text(
                    'Add Work',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
