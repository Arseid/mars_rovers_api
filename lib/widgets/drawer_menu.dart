import 'package:flutter/material.dart';

import 'drawer_menu_header.dart';
import 'drawer_menu_rover_list.dart';

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
          const DrawerMenuHeader(),
          const SizedBox(height: 30),
          const Divider(
            color: Color(0xFFDBC6C0),
            indent: 30,
            endIndent: 30,
          ),
          const SizedBox(height: 18),
          DrawerMenuRoverList(onRoverSelected: onRoverSelected),
        ],
      ),
    );
  }
}