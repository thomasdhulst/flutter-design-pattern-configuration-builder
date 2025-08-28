import 'package:flutter/material.dart';
import 'package:vehicule_card/models/vehicle_specs_data.dart';

class BicycleSpecSection extends StatelessWidget {
  const BicycleSpecSection({super.key, required this.specs});

  final VehicleSpecsData specs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Text(
          '${specs.brand} ${specs.model} • ${specs.wheelCount} roues',
          style: const TextStyle(fontSize: 16),
        ),
        if (specs.shouldShowRegistration)
          Text(
            'Immatriculation: ${specs.registration}',
            style: const TextStyle(color: Colors.grey),
          ),
      ],
    );
  }
}
