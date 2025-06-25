import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class DrawerMenuHeader extends StatelessWidget {
  const DrawerMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Center(
          child: Icon(Icons.rocket, size: 45, color: Colors.pink),
        ),
        SizedBox(height: 8),
        Center(
          child: Text(
            'Mars Rovers',
            style: TextStyle(fontSize: 25, color: AppColors.primaryText),
          ),
        ),
      ],
    );
  }
}
