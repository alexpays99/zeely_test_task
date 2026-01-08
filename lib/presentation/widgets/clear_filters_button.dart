import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ClearFiltersButton extends StatelessWidget {
  final VoidCallback onTap;

  const ClearFiltersButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderDefault),
        ),
        child: const Icon(Icons.close, size: 24, color: AppColors.iconColor),
      ),
    );
  }
}
