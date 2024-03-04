class Visitor {
  final String name;
  final String phone;
  final DateTime checkInTime;
  DateTime? checkOutTime;

  Visitor({
    required this.name,
    required this.phone,
    required this.checkInTime,
    this.checkOutTime,
  });

  @override
  String toString() {
    return 'Visitor{name: $name, phone: $phone, checkInTime: $checkInTime, checkOutTime: $checkOutTime}';
  }
}
