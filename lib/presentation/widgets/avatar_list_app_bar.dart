import 'package:flutter/material.dart';

import '../../core/constants/app_strings.dart';
import '../../core/theme/app_text_styles.dart';

class AvatarListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AvatarListAppBar({super.key, this.onBackPressed});
  final VoidCallback? onBackPressed;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppStrings.allAvatars, style: AppTextStyles.titleLarge),
    );
  }
}
