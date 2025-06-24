import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final Function(String) onRoverSelected;

  const DrawerMenu({super.key, required this.onRoverSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFAF0F2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),

          const Center(
            child: Icon(Icons.rocket, size: 45, color: Colors.pink),
          ),
          const SizedBox(height: 8),
          const Center(
            child: Text(
              'Mars Rovers',
              style: TextStyle(
                fontSize: 25
              ),
            ),
          ),

          const SizedBox(height: 30),

          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                child: Divider(
                  thickness: 1,
                  color: Color(0xFFDBC6C0),
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),
          ...['Spirit', 'Opportunity', 'Curiosity'].map(
                (rover) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: GestureDetector(
                onTap: () {
                  onRoverSelected(rover);
                  Navigator.pop(context);
                },
                child: Text(
                  rover,
                  style: const TextStyle(
                    fontSize: 25
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
