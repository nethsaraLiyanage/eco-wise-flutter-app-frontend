import 'package:flutter/material.dart';

import 'package:eco_wise/screens/error_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/screens/recycle_map_screen.dart';

class ScheduleMapScreen extends StatefulWidget {
  const ScheduleMapScreen({super.key});

  @override
  State<ScheduleMapScreen> createState() => _ScheduleMapScreenState();
}

class _ScheduleMapScreenState extends State<ScheduleMapScreen> {
  void _onShcedule() {
    // post shedule data in the DeviceItem to backend
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ErrorScreen(),
      ),
    );
  }

  void _onBack() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => RecycleMapScreen(),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: _onBack,
          child: const Icon(
            Icons.arrow_back_rounded,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(16),
              width: size.width * 0.895,
              height: size.height * 0.376,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    color: Colors.grey,
                  )
                ],
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Schedule a Collect Time',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                      ),
                      const Icon(Icons.cancel),
                    ],
                  ),
                  Text(
                    'Your item will collect on the date and time set below. (Sri Lankan Timezone)',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.grey[400],
                        ),
                  ),
                  Container(
                    height: size.height * 0.043,
                    width: size.width * 0.768,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 238, 238),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Pickup Time',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: const Color.fromARGB(255, 16, 144, 5),
                              ),
                        ),
                        Text(
                          '02:00 PM',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.043,
                    width: size.width * 0.768,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 241, 238, 238),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Date',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: const Color.fromARGB(255, 16, 144, 5),
                              ),
                        ),
                        Text(
                          'Thursday Jan 18, 2024',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                    onButtonPressed: _onShcedule,
                    height: 48,
                    width: 275,
                    childWidget: Text(
                      'Schedule',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
