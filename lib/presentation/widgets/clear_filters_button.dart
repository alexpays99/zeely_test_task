import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class ClearFiltersButton extends StatelessWidget {
  final VoidCallback onTap;

  const ClearFiltersButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: AppColors.chipBackground,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.close,
          size: 16,
          color: AppColors.iconColor,
        ),
      ),
    );
  }
}
