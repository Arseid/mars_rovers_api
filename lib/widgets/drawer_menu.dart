import 'package:flutter/material.dart';

import 'drawer_menu_header.dart';
import 'drawer_menu_rover_list.dart';
import '../theme/app_colors.dart';

class DrawerMenu extends StatelessWidget {
  final Function(String) onRoverSelected;

  const DrawerMenu({super.key, required this.onRoverSelected});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.drawerBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 60),
          const DrawerMenuHeader(),
          const SizedBox(height: 30),
          const Divider(
            color: AppColors.divider,
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