class PickUp {
  final String name;
  final String category;
  final int quantity;
  DateTime? time;
  final bool isSchedule;

  PickUp({
    required this.name,
    required this.category,
    required this.quantity,
    this.time,
    required this.isSchedule,
  });
}
