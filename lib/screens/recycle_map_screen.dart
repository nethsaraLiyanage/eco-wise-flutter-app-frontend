import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:eco_wise/screens/home_screen.dart';
import 'package:eco_wise/screens/schedule_screen.dart';
import 'package:eco_wise/screens/navigate_map_screen.dart';
import 'package:eco_wise/config/config.dart';

class RecycleMapScreen extends StatefulWidget {
  const RecycleMapScreen({
    super.key,
    required this.item,
    required this.qty,
  });

  final String item;
  final String qty;

  @override
  State<RecycleMapScreen> createState() => _RecycleMapScreenState();
}

class _RecycleMapScreenState extends State<RecycleMapScreen> {
  final searchWord = TextEditingController();
  final yourLocation = TextEditingController();
  final dropLocation = TextEditingController();
  final locationController = Location();
  static const sliitGate = LatLng(6.9142761, 79.9722236);
  static const companyLocation = LatLng(6.8831607, 79.8685644);
  static const company2Location = LatLng(6.8911439, 79.9288831);

  LatLng? currentPosition;
  Map<PolylineId, Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) async => fetchLocationUpdates());
  }

  void _onBack() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => HomeScreen(),
        ),
        (route) => false);
  }

  void _onLater() {
    if (dropLocation.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a drop location from the map'),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => ScheduleScreen(
            yourSelectedLoc: yourLocation.text,
            dropSelectedLoc: dropLocation.text,
            item: widget.item,
            qty: widget.qty,
          ),
        ),
      );
    }
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
          //For physical device
          // yourLocation.text =
          //     '${currentPosition!.latitude.toString()}, ${currentPosition!.longitude.toString()}';

          // For emulator
          yourLocation.text =
              '${sliitGate.latitude.toString()}, ${sliitGate.longitude.toString()}';
        });
      }
    });
  }

  Future<List<LatLng>> fetchPolylinePoints(LatLng tapLoc) async {
    final polylinePoints = PolylinePoints();

    final result = await polylinePoints.getRouteBetweenCoordinates(
      googleMapsApiKey,
      PointLatLng(sliitGate.latitude, sliitGate.longitude),
      PointLatLng(tapLoc.latitude, tapLoc.longitude),
    );

    if (result.points.isNotEmpty) {
      return result.points.map((e) => LatLng(e.latitude, e.longitude)).toList();
    } else {
      return [];
    }
  }

  Future<void> generatePolyLineFromPoints(
      List<LatLng> polylineCoordinates) async {
    const id = PolylineId('polyline');

    final polyline = Polyline(
      polylineId: id,
      color: Colors.blueAccent,
      points: polylineCoordinates,
      width: 5,
    );

    setState(() {
      polylines[id] = polyline;
    });
  }

  Future<void> initializeMap() async {
    await fetchLocationUpdates();
  }

  void _onMarkerTap(LatLng tappedLoc) async {
    setState(() {
      dropLocation.text = '${tappedLoc.latitude}, ${tappedLoc.longitude}';
    });
    final coordinates = await fetchPolylinePoints(tappedLoc);
    generatePolyLineFromPoints(coordinates);
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
            child: currentPosition == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GoogleMap(
                    initialCameraPosition: const CameraPosition(
                      target: sliitGate,
                      zoom: 12,
                    ),
                    onTap: (LatLng tappedLoc) {
                      _onMarkerTap(tappedLoc);
                    },
                    markers: {
                      Marker(
                        markerId: const MarkerId('currentLocation'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueCyan),
                        position: currentPosition!,
                      ),
                      Marker(
                        markerId: MarkerId('SLIIT'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: sliitGate,
                      ),
                      Marker(
                        markerId: MarkerId('companyLocation'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: companyLocation,
                      ),
                      Marker(
                        markerId: MarkerId('company2Location'),
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                            BitmapDescriptor.hueGreen),
                        position: company2Location,
                      )
                    },
                    polylines: Set<Polyline>.of(polylines.values),
                    myLocationButtonEnabled: true,
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
                                readOnly: true,
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
                                // onEditingComplete: _onEditingComplete,
                                readOnly: true,
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
