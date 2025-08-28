class VehicleSpecsData {
  const VehicleSpecsData({
    required this.brand,
    required this.model,
    required this.wheelCount,
    this.imageUrl,
    this.registration,
    this.isLoading = false,
  });

  final String brand;
  final String model;
  final int wheelCount;
  final String? imageUrl;
  final String? registration;
  final bool isLoading;

  bool get shouldShowRegistration =>
      (registration != null && registration!.isNotEmpty);
}
