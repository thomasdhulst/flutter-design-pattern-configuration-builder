import 'package:flutter/material.dart';
import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration/vehicule_with_configuration.dart';

class ListOfVehicule1 extends StatelessWidget {
  const ListOfVehicule1({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      VehicleWidget.car(
        typeLabel: 'Voiture',
        title: 'Ma berline',
        subtitle: 'Confort • 5 places',
        onTap: () => _snack(context, 'Car action'),
        buttonLabel: 'Réserver',
        isActionLoading: false,
        specs: const VehicleSpecsData(
          brand: 'Renault',
          model: 'Clio',
          wheelCount: 4,
          imageUrl: null,
          registration: 'AB-123-CD',
        ),
        engine: const EngineData(fuelType: 'petrol', horsePower: 90),
      ),
      VehicleWidget.bicycle(
        typeLabel: 'Vélo',
        title: 'VTC ville',
        subtitle: 'Léger • 2 roues',
        buttonLabel: 'Réserver',
        isActionLoading: false,
        onTap: () => _snack(context, 'Bike action'),
        specs: const VehicleSpecsData(
          brand: 'Btwin',
          model: 'Riverside',
          wheelCount: 2,
        ),
        isElectric: false,
      ),
      VehicleWidget.car(
        typeLabel: 'Voiture',
        title: 'Électrique',
        buttonLabel: 'Réserver',
        isActionLoading: false,
        subtitle: 'Silence • 0 émission locale',
        onTap: () => _snack(context, 'EV action'),
        specs: const VehicleSpecsData(
          brand: 'Tesla',
          model: 'Model 3',
          wheelCount: 4,
          imageUrl: null,
          registration: 'EV-2042-ZZ',
        ),
        engine: const EngineData(fuelType: 'electric', horsePower: 283),
      ),
      VehicleWidget.bicycle(
        buttonLabel: 'Réserver',
        isActionLoading: false,
        typeLabel: 'Vélo',
        title: 'VAE urbain',
        subtitle: 'Assistance • 2 roues',
        onTap: () => _snack(context, 'eBike action'),
        specs: const VehicleSpecsData(
          brand: 'Canyon',
          model: 'Pathlite:ON',
          wheelCount: 2,
        ),
        isElectric: true,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Mon garage - sans Builder')),
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
