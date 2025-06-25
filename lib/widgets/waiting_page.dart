import 'package:flutter/material.dart';
import 'package:mars_rover_api/theme/app_colors.dart';

class WaitingPage extends StatelessWidget {
  final String message;

  const WaitingPage({
    super.key,
    this.message = 'Récupération des données...',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Text(
          message,
          style: const TextStyle(
            fontSize: 25,
            color: AppColors.primaryText
          ),
        ),
      ),
    );
  }
}
