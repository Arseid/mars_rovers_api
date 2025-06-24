import 'package:flutter/material.dart';

class DrawerMenuRoverList extends StatelessWidget {
  final Function(String) onRoverSelected;

  const DrawerMenuRoverList({super.key, required this.onRoverSelected});

  @override
  Widget build(BuildContext context) {
    final rovers = ['Spirit', 'Opportunity', 'Curiosity'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rovers.map((rover) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: GestureDetector(
            onTap: () {
              onRoverSelected(rover);
              Navigator.pop(context);
            },
            child: Text(
              rover,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        );
      }).toList(),
    );
  }
}
