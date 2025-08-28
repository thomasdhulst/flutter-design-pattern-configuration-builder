import 'package:flutter/material.dart';

class VehiculeCardButton extends StatelessWidget {
  const VehiculeCardButton({
    super.key,
    required this.onTap,
    required this.buttonLabel,
  });

  final VoidCallback onTap;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo.withAlpha(50),
        minimumSize: const Size(200, 60),
        textStyle: const TextStyle(fontSize: 20),
      ),
      child: Text(buttonLabel),
    );
  }
}
