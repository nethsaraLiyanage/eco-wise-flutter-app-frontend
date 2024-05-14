import 'dart:convert';

import 'package:eco_wise/collector_screens/col_success_screen.dart';
import 'package:eco_wise/config/config.dart';
import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import 'package:eco_wise/screens/error_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/screens/recycle_map_screen.dart';
import 'package:eco_wise/screens/success_screen.dart';
import 'package:eco_wise/providers/user_id_provider.dart';

class ColMapScreen extends ConsumerStatefulWidget {
  const ColMapScreen({
    super.key,
    required this.name,
    // required this.qty,
    // required this.yourLoc,
    // required this.dropLoc,
  });

  final String name;
  // final String qty;
  // final String yourLoc;
  // final String dropLoc;

  @override
  ConsumerState<ColMapScreen> createState() => _ColMapScreenState();
}

class _ColMapScreenState extends ConsumerState<ColMapScreen> {
  final locationController = Location();
  static const home = LatLng(6.9142761, 79.9722236);
  static const companyLocation = LatLng(6.8831607, 79.8685644);
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  LatLng? currentPosition;

  void _onPicked() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => ColSuccessScreen(),
        ),
        (route) => false);
  }

  Future<void> fetchLocationUpdates() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await locationController.serviceEnabled();

    if (serviceEnabled) {
      serviceEnabled = await locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationController.onLocationChanged.listen((currentLocation) {
      if (currentLocation.latitude != null &&
          currentLocation.longitude != null) {
        if (!mounted) return;
        setState(() {
          currentPosition = LatLng(
            currentLocation.latitude!,
            currentLocation.longitude!,
          );
        });
      }
    });
  }

  void _onTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
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
            // child: currentPosition == null
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: home,
                zoom: 12,
              ),
              markers: {
                // Marker(
                //   markerId: const MarkerId('currentLocation'),
                //   icon: BitmapDescriptor.defaultMarker,
                //   position: currentPosition!,
                // ),
                const Marker(
                  markerId: MarkerId('sourceLocation'),
                  icon: BitmapDescriptor.defaultMarker,
                  position: home,
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
                  Text(
                    'Pickup address',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/pin.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        '273, Colombo Road, Galle.',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.green[800],
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset('assets/images/man.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        widget.name,
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ),
                      const SizedBox(
                        width: 35,
                      ),
                      Image.asset('assets/images/text.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      Image.asset('assets/images/call.png'),
                    ],
                  ),
                  Container(
                    height: size.height * 0.095,
                    width: size.width * 0.809,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Road Distance',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                '3KM',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const VerticalDivider(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Estimated Time',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                              Text(
                                '12 Minutes',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomElevatedButton(
                      onButtonPressed: _onPicked,
                      height: 42,
                      width: 138,
                      childWidget: Text(
                        'Picked',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
