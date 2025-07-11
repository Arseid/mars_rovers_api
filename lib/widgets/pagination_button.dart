import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class PaginationButtons extends StatelessWidget {
  final bool hasPrevious;
  final bool hasNext;
  final VoidCallback? onPrevious;
  final VoidCallback? onNext;

  const PaginationButtons({
    super.key,
    required this.hasPrevious,
    required this.hasNext,
    this.onPrevious,
    this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButton(
          label: 'Previous',
          enabled: hasPrevious,
          onPressed: onPrevious,
        ),
        _buildButton(
          label: 'Next',
          enabled: hasNext,
          onPressed: onNext,
        ),
      ],
    );
  }

  Widget _buildButton({
    required String label,
    required bool enabled,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: enabled ? onPressed : null,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonBackground,
        foregroundColor: AppColors.buttonText,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
      ),
      child: Text(label),
    );
  }
}
