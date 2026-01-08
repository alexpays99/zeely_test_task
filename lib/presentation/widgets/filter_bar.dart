import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../domain/entities/avatar_filter.dart';
import 'clear_filters_button.dart';
import 'filter_chip_button.dart';

class FilterBar extends StatelessWidget {
  final AvatarFilter filter;
  final bool hasActiveFilters;
  final VoidCallback onClearFilters;
  final VoidCallback onGenderTap;
  final VoidCallback onAgeTap;
  final VoidCallback onPoseTap;

  const FilterBar({
    super.key,
    required this.filter,
    required this.hasActiveFilters,
    required this.onClearFilters,
    required this.onGenderTap,
    required this.onAgeTap,
    required this.onPoseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (hasActiveFilters) ...[
              ClearFiltersButton(onTap: onClearFilters),
              const SizedBox(width: 8),
            ],
            FilterChipButton(
              label: AppStrings.gender,
              isActive: filter.genders.isNotEmpty,
              activeCount: filter.genders.length,
              onTap: onGenderTap,
            ),
            const SizedBox(width: 8),
            FilterChipButton(
              label: AppStrings.age,
              isActive: filter.ageGroups.isNotEmpty,
              activeCount: filter.ageGroups.length,
              onTap: onAgeTap,
            ),
            const SizedBox(width: 8),
            FilterChipButton(
              label: AppStrings.pose,
              isActive: filter.poses.isNotEmpty,
              activeCount: filter.poses.length,
              onTap: onPoseTap,
            ),
          ],
        ),
      ),
    );
  }
}
