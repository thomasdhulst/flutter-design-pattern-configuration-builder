import 'package:flutter/material.dart';
import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/widgets/widgets.dart';

import 'vehicle_models.dart';

class VehicleWidget extends StatelessWidget {
  const VehicleWidget._({required this.configuration, super.key});

  final VehicleConfiguration configuration;

  factory VehicleWidget.car({
    required String typeLabel,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required String buttonLabel,
    required bool isActionLoading,
    required VehicleSpecsData specs,
    required EngineData engine,
    Key? key,
  }) => VehicleWidget._(
    key: key,
    configuration: CarConfiguration(
      typeLabel: typeLabel,
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      buttonLabel: buttonLabel,
      isActionLoading: isActionLoading,
      specs: specs,
      engine: engine,
    ),
  );

  factory VehicleWidget.bicycle({
    required String typeLabel,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    required String buttonLabel,
    required bool isActionLoading,
    required VehicleSpecsData specs,
    bool isElectric = false,
    Key? key,
  }) => VehicleWidget._(
    key: key,
    configuration: BicycleConfiguration(
      typeLabel: typeLabel,
      title: title,
      subtitle: subtitle,
      onTap: onTap,
      buttonLabel: buttonLabel,
      isActionLoading: isActionLoading,
      specs: specs,
      isElectric: isElectric,
    ),
  );

  @override
  Widget build(BuildContext context) => VehiculeCard(
    header: VehiculeCardHeader(
      vehicleType: configuration.typeLabel,
      title: configuration.title,
      subtitle: configuration.subtitle,
      icon: configuration.buildIcon(),
    ),
    specs: configuration.buildEngineSection(),
    engine: configuration.buildSpecsSection(),
    button: configuration.buildButton(),
  );
}
