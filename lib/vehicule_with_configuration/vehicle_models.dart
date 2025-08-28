import 'package:flutter/material.dart';
import 'package:vehicule_card/models/engine_data.dart';
import 'package:vehicule_card/models/vehicle_specs_data.dart';
import 'package:vehicule_card/models/vehicle_type.dart';
import 'package:vehicule_card/widgets/widgets.dart';

abstract class VehicleConfiguration {
  const VehicleConfiguration({
    required this.typeLabel,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.buttonLabel,
    required this.isActionLoading,
  });

  final String typeLabel;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final String? buttonLabel;
  final bool isActionLoading;

  VehicleType get vehicleType;

  Widget buildIcon();
  Widget? buildSpecsSection();
  Widget? buildEngineSection();
  Widget? buildButton();
}

class CarConfiguration extends VehicleConfiguration {
  const CarConfiguration({
    required super.typeLabel,
    required super.title,
    required super.subtitle,
    required super.onTap,
    required super.buttonLabel,
    required super.isActionLoading,
    required this.specs,
    required this.engine,
    this.doorCount = 4,
    this.hasSunroof = false,
  });

  final VehicleSpecsData specs;
  final EngineData engine;
  final int doorCount;
  final bool hasSunroof;

  @override
  VehicleType get vehicleType => VehicleType.car;

  @override
  Widget buildIcon() => CarIcon();

  @override
  Widget buildSpecsSection() {
    if (specs.isLoading) return const CircularProgressIndicator();
    return CarSpecSection(specs: specs);
  }

  @override
  Widget buildEngineSection() {
    return CarEngineSection(engine: engine);
  }

  @override
  Widget? buildButton() {
    return VehiculeCardButton(
      onTap: onTap ?? () {},
      buttonLabel: buttonLabel ?? 'No button',
    );
  }
}

class BicycleConfiguration extends VehicleConfiguration {
  const BicycleConfiguration({
    required super.typeLabel,
    required super.title,
    required super.subtitle,
    required super.onTap,
    required super.buttonLabel,
    required super.isActionLoading,
    required this.specs,
    this.isElectric = false,
  });

  final VehicleSpecsData specs;
  final bool isElectric;

  @override
  VehicleType get vehicleType => VehicleType.bicycle;

  @override
  Widget buildIcon() =>
      const Icon(Icons.directions_bike, color: Colors.green, size: 32);

  @override
  Widget buildSpecsSection() {
    if (specs.isLoading) return const CircularProgressIndicator();
    return BicycleSpecSection(specs: specs);
  }

  @override
  Widget? buildEngineSection() => null;

  @override
  Widget? buildButton() {
    return VehiculeCardButton(
      onTap: onTap ?? () {},
      buttonLabel: buttonLabel ?? 'No button',
    );
  }
}
