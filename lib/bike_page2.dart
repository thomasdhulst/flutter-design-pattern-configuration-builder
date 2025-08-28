import 'package:flutter/material.dart';
import 'package:vehicule_card/views/bike_in_action_with_builder.dart';

class BikePage2 extends StatelessWidget {
  const BikePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vélo en action - avec Builder')),
      body: BikeInActionWithBuilder(),
    );
  }
}
