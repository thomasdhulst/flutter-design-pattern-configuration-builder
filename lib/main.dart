import 'package:flutter/material.dart';
import 'package:vehicule_card/bike_page1.dart';
import 'package:vehicule_card/bike_page2.dart';
import 'package:vehicule_card/list_of_vehicles2.dart';
import 'package:vehicule_card/list_of_vehicule1.dart';
import 'package:vehicule_card/widgets/vehicles_demo_app.dart';

void main() {
  final bodies = const [
    ListOfVehicule1(),
    ListOfVehicles2(),
    BikePage1(),
    BikePage2(),
  ];
  runApp(VehiclesDemoApp(body: bodies[3]));
}
