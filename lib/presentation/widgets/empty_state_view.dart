import 'package:flutter/material.dart';
import 'package:zeely_test_task/core/constants/app_colors.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_text_styles.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key, required this.onClearFilters});
  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty_cup.png', width: 120, height: 120),
            const SizedBox(height: 24),
            Text(
              AppStrings.nothingFound,
              textAlign: TextAlign.center,
              style: AppTextStyles.emptyStateTitle,
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onClearFilters,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: AppColors.borderDefault, width: 1),
                ),
                child: Text(
                  AppStrings.clearFilters,
                  style: AppTextStyles.emptyStateAction,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
