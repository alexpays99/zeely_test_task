import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';

class EmptyStateView extends StatelessWidget {
  final VoidCallback onClearFilters;

  const EmptyStateView({
    super.key,
    required this.onClearFilters,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty_cup.png',
              width: 120,
              height: 120,
            ),
            const SizedBox(height: 24),
            const Text(
              AppStrings.nothingFound,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: onClearFilters,
              child: const Text(
                AppStrings.clearFilters,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.clearFiltersText,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
