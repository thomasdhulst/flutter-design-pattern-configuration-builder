import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:vehicule_card/models/models.dart';
import 'package:vehicule_card/vehicule_with_configuration_and_builder/vehicule_with_configuration_and_builder.dart';

void main() {
  testWidgets('BikeLoadingBuilder shows progress and overrides button', (tester) async {
    final config = BicycleCardConfiguration(
      typeLabel: 'Vélo',
      title: 'Loading Bike',
      subtitle: 'Please wait',
      onTap: () {},
      buttonLabel: 'Should be overridden',
      specs: const VehicleSpecsData(
        brand: 'Brand',
        model: 'X',
        wheelCount: 2,
      ),
      isElectric: true,
    );

    final builder = BikeLoadingBuilder(configuration: config);
    const director = VehicleWidgetDirector();
    director.buildBikeCard(builder);

    final widget = builder.build();

    await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.text('LOADING'), findsOneWidget);
    // Still a bike specific icon should NOT be present since we replaced it
    expect(find.byIcon(Icons.directions_bike), findsNothing);
  });
}
