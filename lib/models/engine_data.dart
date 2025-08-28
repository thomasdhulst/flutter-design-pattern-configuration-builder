class EngineData {
  const EngineData({required this.fuelType, this.horsePower});

  final String fuelType; // petrol, diesel, electric, human
  final int? horsePower;

  bool get isElectric => fuelType.toLowerCase() == 'electric';
}
