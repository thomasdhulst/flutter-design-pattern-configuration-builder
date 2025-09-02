import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicule_with_configuration_and_builder.dart';

void main() {
  group('VehiculeCard builder', () {
    testWidgets('builds a car card with engine and button', (tester) async {
      var tapped = 0;

      final config = CarCardConfiguration(
        typeLabel: 'Voiture',
        title: 'Tesla Model S',
        subtitle: 'Plaid',
        onTap: () => tapped++,
        buttonLabel: 'BUY',
        specs: const VehicleSpecsData(
          brand: 'Tesla',
          model: 'Model S',
          wheelCount: 4,
          registration: 'AB-123-CD',
        ),
        engine: const EngineData(fuelType: 'electric', horsePower: 1020),
      );

      final builder = CarBuilder(configuration: config);
      const director = VehicleWidgetDirector();
      director.buildCarCard(builder);

      final widget = builder.build();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      // Header
      expect(find.text('Tesla Model S'), findsOneWidget);
      expect(find.text('Plaid'), findsOneWidget);
      expect(find.text('car'), findsOneWidget); // vehicleType trailing label

      // Icon
      expect(find.byIcon(Icons.directions_car), findsOneWidget);

      // Specs section
      expect(find.textContaining('Tesla Model S'), findsOneWidget);
      expect(find.textContaining('4 roues'), findsOneWidget);
      expect(find.textContaining('Immatriculation'), findsOneWidget);

      // Engine section
      expect(find.textContaining('Carburant: electric'), findsOneWidget);
      expect(find.textContaining('1020 ch'), findsOneWidget);
      expect(find.byIcon(Icons.bolt), findsOneWidget);

      // Button
      expect(find.text('BUY'), findsOneWidget);
      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();
      expect(tapped, 1);
    });

    testWidgets('builds a bike card without engine and without button (recipe)', (tester) async {
      final config = BicycleCardConfiguration(
        typeLabel: 'Vélo',
        title: 'Canyon Roadlite',
        subtitle: 'Fitness bike',
        onTap: () {},
        buttonLabel: 'RIDE', // Won't be used in this recipe
        specs: const VehicleSpecsData(
          brand: 'Canyon',
          model: 'Roadlite',
          wheelCount: 2,
        ),
        isElectric: false,
      );

      final builder = BikeBuilder(configuration: config);
      const director = VehicleWidgetDirector();
      director.buildBikeCardWithNoButton(builder);

      final widget = builder.build();

      await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

      // Header
      expect(find.text('Canyon Roadlite'), findsOneWidget);
      expect(find.text('Fitness bike'), findsOneWidget);
      expect(find.text('bicycle'), findsOneWidget);

      // Icon
      expect(find.byIcon(Icons.directions_bike), findsOneWidget);

      // Specs section
      expect(find.textContaining('2 roues'), findsOneWidget);

      // Engine should be absent for bike
      expect(find.textContaining('Carburant:'), findsNothing);

      // Button should be absent in this recipe
      expect(find.text('RIDE'), findsNothing);
    });
  });
}
