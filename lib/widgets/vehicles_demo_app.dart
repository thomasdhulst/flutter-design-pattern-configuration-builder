import 'package:flutter/material.dart';

class VehiclesDemoApp extends StatelessWidget {
  const VehiclesDemoApp({super.key, required this.body});
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon garage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),

      home: Banner(
        message: 'Thomas D.',
        location: BannerLocation.topEnd,
        layoutDirection: TextDirection.ltr,
        textDirection: TextDirection.ltr,
        child: body,
      ),
    );
  }
}
