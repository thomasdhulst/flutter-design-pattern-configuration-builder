import 'package:flutter/material.dart';
import 'package:vehicule_card/models/engine_data.dart';

class CarEngineSection extends StatelessWidget {
  const CarEngineSection({super.key, required this.engine});

  final EngineData engine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Carburant: ${engine.fuelType}',
          style: const TextStyle(fontSize: 15),
        ),
        if (engine.horsePower != null)
          Text('${engine.horsePower} ch', style: const TextStyle(fontSize: 15)),
        if (engine.isElectric)
          const Icon(Icons.bolt, color: Colors.amber, size: 18),
      ],
    );
  }
}
