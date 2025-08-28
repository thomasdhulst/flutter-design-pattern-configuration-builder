import 'package:flutter/material.dart';
import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicle_configuration.dart';
import 'package:vehicule_card/widgets/widgets.dart';

abstract class VehiculeCardBuilder {
  VehiculeCardBuilder();

  late String _vehicleType;
  late String _title;
  late String _subtitle;
  late Widget _icon;

  Widget? _specs;
  Widget? _engine;
  Widget? _button;

  void withType();
  void withTitle();
  void withSubtitle();
  void withIcon();
  void withSpecs();
  void withEngine();
  void withButton();

  Widget build() => VehiculeCard(
    header: VehiculeCardHeader(
      vehicleType: _vehicleType,
      title: _title,
      subtitle: _subtitle,
      icon: _icon,
    ),
    specs: _specs,
    engine: _engine,
    button: _button,
  );
}

class CarBuilder extends VehiculeCardBuilder {
  final CarCardConfiguration configuration;

  CarBuilder({required this.configuration});
  @override
  void withEngine() {
    _engine = CarEngineSection(engine: configuration.engine);
  }

  @override
  void withIcon() {
    _icon = CarIcon();
  }

  @override
  void withSpecs() {
    _specs = CarSpecSection(specs: configuration.specs);
  }

  @override
  void withSubtitle() {
    _subtitle = configuration.subtitle;
  }

  @override
  void withTitle() {
    _title = configuration.title;
  }

  @override
  void withType() {
    _vehicleType = configuration.vehicleType.name;
  }

  @override
  void withButton() {
    _button = VehiculeCardButton(
      onTap: configuration.onTap,
      buttonLabel: configuration.buttonLabel,
    );
  }
}

class BikeBuilder extends VehiculeCardBuilder {
  final BicycleCardConfiguration configuration;

  BikeBuilder({required this.configuration});

  @override
  void withEngine() {
    _engine = null;
  }

  @override
  void withIcon() {
    _icon = BikeIcon();
  }

  @override
  void withSpecs() {
    _specs = BicycleSpecSection(specs: configuration.specs);
  }

  @override
  void withSubtitle() {
    _subtitle = configuration.subtitle;
  }

  @override
  void withTitle() {
    _title = configuration.title;
  }

  @override
  void withType() {
    _vehicleType = configuration.vehicleType.name;
  }

  @override
  void withButton() {
    _button = VehiculeCardButton(
      onTap: configuration.onTap,
      buttonLabel: configuration.buttonLabel,
    );
  }
}

class BikeLoadingBuilder extends BikeBuilder {
  BikeLoadingBuilder({required super.configuration});

  @override
  void withIcon() {
    _icon = CircularProgressIndicator();
  }

  @override
  void withButton() {
    _button = VehiculeCardButton(onTap: () {}, buttonLabel: 'LOADING');
  }
}
