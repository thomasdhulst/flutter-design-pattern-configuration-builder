import 'package:flutter/material.dart';

class VehiculeCardHeader extends StatelessWidget {
  const VehiculeCardHeader({
    super.key,
    required this.vehicleType,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String vehicleType;
  final String title;
  final String subtitle;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      subtitle: Text(subtitle),
      leading: CircleAvatar(
        radius: 24,
        backgroundColor: Colors.indigo.shade50,
        child: icon,
      ),
      trailing: Text(
        vehicleType,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }
}
