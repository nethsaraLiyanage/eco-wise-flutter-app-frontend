import 'package:eco_wise/screens/navigate_map_screen.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eco_wise/screens/home_screen.dart';
import 'package:eco_wise/screens/schedule_screen.dart';

class RecycleMapScreen extends StatefulWidget {
  const RecycleMapScreen({super.key});

  @override
  State<RecycleMapScreen> createState() => _RecycleMapScreenState();
}

class _RecycleMapScreenState extends State<RecycleMapScreen> {
  final searchWord = TextEditingController();
  final yourLocation = TextEditingController();
  final dropLocation = TextEditingController();
  static const sliitGate = LatLng(6.9142761, 79.9722236);
  static const companyLocation = LatLng(6.8831607, 79.8685644);

  void _onBack() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
        (route) => false);
  }

  void _onLater() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => ScheduleScreen(),
      ),
    );
  }

  void _onEditingComplete() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (yourLocation.text.isEmpty || dropLocation.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please Enter Your Location and Collector'),
          duration: Duration(seconds: 5),
        ),
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const NavigateMapScreen(),
        ),
        (route) => false,
      );
    }
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
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: sliitGate,
                zoom: 12,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: sliitGate,
                ),
                const Marker(
                  markerId: MarkerId('companyLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: companyLocation,
                )
              },
            ),
          ),
          Container(
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.0633,
                    width: size.width * 0.35,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 200, 236, 197),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: _onLater,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.timelapse_outlined,
                            color: Colors.black,
                          ),
                          Text(
                            'Later',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: size.width * 0.895,
                    height: size.height * 0.224,
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
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                left: 10,
                                top: 10,
                              ),
                              height: size.height * 0.052,
                              width: size.width * 0.445,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(255, 233, 232, 232),
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 2,
                                    color: Colors.grey,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.search),
                                  SizedBox(
                                    width: size.width * 0.36,
                                    child: TextField(
                                      controller: searchWord,
                                      decoration: const InputDecoration(
                                        labelText: "Search",
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Padding(
                                padding: EdgeInsets.only(
                                  right: 40,
                                  top: 10,
                                ),
                                child: Icon(
                                  Icons.favorite_border,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(
                                'COLLECT',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color:
                                          const Color.fromARGB(255, 0, 125, 12),
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.595,
                              child: TextField(
                                controller: yourLocation,
                                decoration: const InputDecoration(
                                  labelText: "Your Location",
                                ),
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 7),
                              child: Text(
                                'DROP',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                    ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.595,
                              child: TextField(
                                controller: dropLocation,
                                decoration: const InputDecoration(
                                  labelText: "Select Your Collector",
                                ),
                                onEditingComplete: _onEditingComplete,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
