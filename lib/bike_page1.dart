import 'package:flutter/material.dart';
import 'package:vehicule_card/views/bike_card_without_builder.dart';

class BikePage1 extends StatelessWidget {
  const BikePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vélo en action')),
      body: BikeCardWithoutBuilder(),
    );
  }
}
