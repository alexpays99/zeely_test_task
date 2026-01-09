import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 25),
        decoration: BoxDecoration(
          color: AppColors.buttonPrimary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: AppTextStyles.buttonLabel,
        ),
      ),
    );
  }
}
