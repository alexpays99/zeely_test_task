import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/utils/filter_display_helper.dart';
import '../../domain/entities/avatar.dart';

class AvatarGridItem extends StatelessWidget {
  const AvatarGridItem({super.key, required this.avatar});
  final Avatar avatar;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            avatar.imageUrl,
            fit: BoxFit.cover,
            errorBuilder:
                (context, error, stackTrace) => Container(
                  color: AppColors.chipBackground,
                  child: Center(
                    child: Text(
                      avatar.name[0],
                      style: AppTextStyles.titleLarge.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(avatar.name, style: AppTextStyles.avatarName),
                Text(
                  '${avatar.gender.shortLabel} · ${avatar.age}',
                  style: AppTextStyles.avatarSubtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
