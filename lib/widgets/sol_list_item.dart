import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class SolListItem extends StatelessWidget {
  final int solNumber;
  final String date;
  final int photoCount;
  final VoidCallback? onTap;

  const SolListItem({
    super.key,
    required this.solNumber,
    required this.date,
    required this.photoCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: RichText(
        text: TextSpan(
          text: 'Sol $solNumber',
          style: const TextStyle(
            color: AppColors.secondaryText,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          children: [
            TextSpan(
              text: ' on $date',
              style: const TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      trailing: Text(
        '$photoCount',
        style: const TextStyle(
          color: AppColors.accentText,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
