import 'package:eco_wise/screens/success_screen.dart';
import 'package:flutter/material.dart';

import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eco_wise/screens/error_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:eco_wise/screens/recycle_map_screen.dart';

class ScheduleMapScreen extends StatefulWidget {
  const ScheduleMapScreen({super.key});

  @override
  State<ScheduleMapScreen> createState() => _ScheduleMapScreenState();
}

class _ScheduleMapScreenState extends State<ScheduleMapScreen> {
  final locationController = Location();
  static const sliitGate = LatLng(6.9142761, 79.9722236);
  static const companyLocation = LatLng(6.8831607, 79.8685644);
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  LatLng? currentPosition;

  void _onShcedule() {
    // post shedule data in the DeviceItem to backend

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SuccessScreen(),
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
            // child: currentPosition == null
            //     ? const Center(
            //         child: CircularProgressIndicator(),
            //       )
            //     :
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: sliitGate,
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
                  InkWell(
                    onTap: _onTime,
                    child: Container(
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
                            '${selectedTime.hour}:${selectedTime.minute}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _selectDate,
                    child: Container(
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
                            '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                          ),
                        ],
                      ),
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
