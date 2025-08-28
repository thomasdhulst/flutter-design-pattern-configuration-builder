import 'package:flutter/material.dart';

class VehiculeCard extends StatelessWidget {
  const VehiculeCard({
    super.key,
    required this.header,
    required this.specs,
    required this.engine,
    this.button,
  });

  final Widget header;
  final Widget? specs;
  final Widget? engine;
  final Widget? button;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shadowColor: Colors.indigo.shade100,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 8,
          children: [
            header,
            const Divider(),
            if (specs != null) specs!,
            if (engine != null) engine!,
            if (button != null)
              SizedBox(width: double.infinity, child: button!),
          ],
        ),
      ),
    );
  }
}
