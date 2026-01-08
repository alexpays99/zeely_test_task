import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/utils/filter_display_helper.dart';
import '../../domain/entities/avatar.dart';

class AvatarGridItem extends StatelessWidget {
  final Avatar avatar;

  const AvatarGridItem({
    super.key,
    required this.avatar,
  });

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
            errorBuilder: (context, error, stackTrace) => Container(
              color: AppColors.chipBackground,
              child: Center(
                child: Text(
                  avatar.name[0],
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
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
                Text(
                  avatar.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
                Text(
                  '${FilterDisplayHelper.getGenderShortLabel(avatar.gender)} · ${avatar.age}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: AppColors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
