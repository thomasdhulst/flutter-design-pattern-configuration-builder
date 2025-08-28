import 'package:flutter/material.dart';
import 'package:vehicule_card/models/models.dart';

abstract class VehicleCardConfiguration {
  const VehicleCardConfiguration({
    required this.typeLabel,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.buttonLabel,
  });

  final String typeLabel;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final String buttonLabel;

  VehicleType get vehicleType;
}

class CarCardConfiguration extends VehicleCardConfiguration {
  const CarCardConfiguration({
    required super.typeLabel,
    required super.title,
    required super.subtitle,
    required super.onTap,
    required super.buttonLabel,
    required this.specs,
    required this.engine,
  });

  final VehicleSpecsData specs;
  final EngineData engine;

  @override
  VehicleType get vehicleType => VehicleType.car;
}

class BicycleCardConfiguration extends VehicleCardConfiguration {
  const BicycleCardConfiguration({
    required super.typeLabel,
    required super.title,
    required super.subtitle,
    required super.onTap,
    required super.buttonLabel,
    required this.specs,
    this.isElectric = false,
  });

  final VehicleSpecsData specs;
  final bool isElectric;

  @override
  VehicleType get vehicleType => VehicleType.bicycle;
}
