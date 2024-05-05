import 'package:eco_wise/models/location_model.dart';

class DeviceItem {
  DeviceItem({
    required this.title,
    required this.points,
    required this.date,
    required this.qty,
    required this.userName,
    required this.isScheduled,
    required this.scheduledTime,
    required this.pickupLocation,
    required this.dropLocation,
  });

  final String title;
  final int points;
  final int qty;
  final DateTime date;
  final String userName;
  final bool isScheduled;
  final DateTime scheduledTime;
  final Location pickupLocation;
  final Location dropLocation;
}
