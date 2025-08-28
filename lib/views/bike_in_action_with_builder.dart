import 'package:flutter/material.dart';

import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicule_with_configuration_and_builder.dart';

class BikeInActionWithBuilder extends StatefulWidget {
  const BikeInActionWithBuilder({super.key});

  @override
  State<BikeInActionWithBuilder> createState() =>
      _BikeInActionWithBuilderState();
}

class _BikeInActionWithBuilderState extends State<BikeInActionWithBuilder> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final bikeConfiguration = BicycleCardConfiguration(
      typeLabel: 'Vélo',
      title: 'VTC ville',
      subtitle: 'Léger • 2 roues',
      specs: const VehicleSpecsData(
        brand: 'Btwin',
        model: 'Riverside',
        wheelCount: 2,
      ),
      isElectric: false,
      onTap: onTap,
      buttonLabel: 'Appuie-moi',
    );

    final bikeBuilder =
        isLoading
            ? BikeLoadingBuilder(configuration: bikeConfiguration)
            : BikeBuilder(configuration: bikeConfiguration);

    final vehicleWidgetDirector = VehicleWidgetDirector();
    vehicleWidgetDirector.buildBikeCard(bikeBuilder);

    return bikeBuilder.build();
  }

  void onTap() {
    setState(() {
      isLoading = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Bike action')));
    });
  }
}
