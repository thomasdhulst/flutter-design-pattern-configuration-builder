import 'package:flutter/material.dart';
import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicule_with_configuration_and_builder.dart';

class ListOfVehicles2 extends StatelessWidget {
  const ListOfVehicles2({super.key});

  @override
  Widget build(BuildContext context) {
    final carConfiguration1 = CarCardConfiguration(
      typeLabel: 'Voiture',
      title: 'Ma berline',
      subtitle: 'Confort • 5 places',
      onTap: () => _snack(context, 'Car action'),
      buttonLabel: 'Réessayer',
      specs: const VehicleSpecsData(
        brand: 'Renault',
        model: 'Clio',
        wheelCount: 4,
        imageUrl: null,
        registration: 'AB-123-CD',
      ),
      engine: const EngineData(fuelType: 'petrol', horsePower: 90),
    );

    final carConfiguration2 = CarCardConfiguration(
      typeLabel: 'Voiture',
      title: 'Électrique',
      subtitle: 'Silence • 0 émission locale',
      onTap: () => _snack(context, 'EV action'),
      buttonLabel: 'Réessayer',
      specs: const VehicleSpecsData(
        brand: 'Tesla',
        model: 'Model 3',
        wheelCount: 4,
        imageUrl: null,
        registration: 'EV-2042-ZZ',
      ),
      engine: const EngineData(fuelType: 'electric', horsePower: 283),
    );

    final carBuilders = [
      CarBuilder(configuration: carConfiguration1),
      CarBuilder(configuration: carConfiguration2),
    ];
    final bikeConfiguration1 = BicycleCardConfiguration(
      typeLabel: 'Vélo',
      title: 'VTC ville',
      subtitle: 'Léger • 2 roues',
      onTap: () => _snack(context, 'Bike action'),
      buttonLabel: 'Réessayer',
      specs: const VehicleSpecsData(
        brand: 'Btwin',
        model: 'Riverside',
        wheelCount: 2,
      ),
      isElectric: false,
    );

    final bikeBuilder = BikeBuilder(configuration: bikeConfiguration1);

    final vehicleWidgetDirector = VehicleWidgetDirector();
    vehicleWidgetDirector.buildCarCard(carBuilders[0]);
    vehicleWidgetDirector.buildCarCard(carBuilders[1]);
    vehicleWidgetDirector.buildBikeCard(bikeBuilder);

    final items = [
      carBuilders[0].build(),
      carBuilders[1].build(),
      bikeBuilder.build(),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mon garage - avec Builder & Director')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) => items[i],
      ),
    );
  }

  static void _snack(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
