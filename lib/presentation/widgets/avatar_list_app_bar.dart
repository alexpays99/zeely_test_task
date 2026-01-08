import 'package:flutter/material.dart';
import '../../core/constants/app_strings.dart';

class AvatarListAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onBackPressed;

  const AvatarListAppBar({
    super.key,
    this.onBackPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 20),
        onPressed: onBackPressed,
      ),
      title: const Text(AppStrings.allAvatars),
    );
  }
}
