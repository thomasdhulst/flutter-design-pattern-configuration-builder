import 'package:flutter/material.dart';

import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration/vehicule_with_configuration.dart';

class BikeCardWithoutBuilder extends StatefulWidget {
  const BikeCardWithoutBuilder({super.key});

  @override
  State<BikeCardWithoutBuilder> createState() => _BikeCardWithoutBuilderState();
}

class _BikeCardWithoutBuilderState extends State<BikeCardWithoutBuilder> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return VehicleWidget.bicycle(
      typeLabel: 'Vélo',
      title: 'VTC ville',
      subtitle: 'Léger • 2 roues',
      buttonLabel: isLoading ? '...' : 'Appuie-moi',
      onTap: onTap,
      isActionLoading: isLoading,
      specs: const VehicleSpecsData(
        brand: 'Btwin',
        model: 'Riverside',
        wheelCount: 2,
      ),
    );
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
