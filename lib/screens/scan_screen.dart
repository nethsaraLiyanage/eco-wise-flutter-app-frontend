import 'dart:typed_data';

import 'package:eco_wise/screens/recycle_map_screen.dart';
import 'package:eco_wise/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  var isItemScanned = false;

  void _onRecycle() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (ctx) => const RecycleMapScreen(
            item: 'Mobile',
            qty: '1',
          ),
        ),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Scan',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: size.width * 0.908,
              height: size.width * 0.908,
              child: MobileScanner(
                controller: MobileScannerController(
                  detectionSpeed: DetectionSpeed.noDuplicates,
                  returnImage: true,
                ),
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  final Uint8List? image = capture.image;

                  for (final barcode in barcodes) {
                    print('Barcode found: ${barcode.rawValue}');
                  }

                  if (image != null) {
                    setState(() {
                      isItemScanned = true;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
            if (isItemScanned)
              Container(
                width: size.width * 0.9,
                height: size.height * 0.23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 252, 252, 252),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 2,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Laptop Device',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
                          ),
                          Text(
                            '20 points',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10,
                      ),
                      child: Text(
                        'Put this item in recycle bin to save environment and earn points',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomElevatedButton(
                      onButtonPressed: _onRecycle,
                      height: 46,
                      width: 109,
                      childWidget: Text(
                        'Recycle',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                      ),
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
