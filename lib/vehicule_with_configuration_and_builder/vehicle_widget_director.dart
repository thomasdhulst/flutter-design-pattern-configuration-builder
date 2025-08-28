import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicle_builder.dart';

class VehicleWidgetDirector {
  const VehicleWidgetDirector();

  void buildCarCard(CarBuilder carBuilder) {
    carBuilder
      ..withType()
      ..withTitle()
      ..withSubtitle()
      ..withIcon()
      ..withButton()
      ..withSpecs()
      ..withEngine();
  }

  void buildCarCardWithoutSpecs(CarBuilder carBuilder) {
    carBuilder
      ..withType()
      ..withTitle()
      ..withSubtitle()
      ..withIcon()
      ..withButton();
  }

  void buildBikeCard(BikeBuilder bikeBuilder) {
    bikeBuilder
      ..withType()
      ..withTitle()
      ..withButton()
      ..withSubtitle()
      ..withIcon()
      ..withSpecs();
  }

  void buildBikeCardWithNoButton(BikeBuilder bikeBuilder) {
    bikeBuilder
      ..withType()
      ..withTitle()
      ..withSubtitle()
      ..withIcon()
      ..withSpecs();
  }
}
