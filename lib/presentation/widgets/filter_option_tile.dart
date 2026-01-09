import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_text_styles.dart';

class FilterOptionTile extends StatelessWidget {
  const FilterOptionTile({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
    this.subtitle,
  });
  final String title;
  final String? subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.filterOptionTitle),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle!, style: AppTextStyles.filterOptionSubtitle),
                  ],
                ],
              ),
            ),
            AnimatedContainer(
              duration: AppConstants.animationFast,
              curve: Curves.easeInOut,
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color:
                      isSelected
                          ? AppColors.radioActive
                          : AppColors.radioInactive,
                  width: 2,
                ),
                color: isSelected ? AppColors.radioActive : AppColors.white,
              ),
              child: AnimatedOpacity(
                duration: AppConstants.animationFast,
                opacity: isSelected ? 1.0 : 0.0,
                child: const Icon(
                  Icons.check,
                  size: 12,
                  color: AppColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
