import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import 'app_theme.dart';

abstract final class AppTextStyles {
  static const TextStyle _base = TextStyle(
    fontFamily: AppTheme.fontFamily,
    color: AppColors.textPrimary,
  );

  static TextStyle get titleLarge =>
      _base.copyWith(fontSize: 26, fontWeight: FontWeight.w700, height: 1.2);

  static TextStyle get titleMedium =>
      _base.copyWith(fontSize: 26, fontWeight: FontWeight.w700, height: 1.2);

  static TextStyle get emptyStateTitle =>
      _base.copyWith(fontSize: 22, fontWeight: FontWeight.w700, height: 1.2);

  static TextStyle get emptyStateAction =>
      _base.copyWith(fontSize: 16, fontWeight: FontWeight.w600, height: 1.35);

  static TextStyle get filterChipLabel =>
      _base.copyWith(fontSize: 12, fontWeight: FontWeight.w600, height: 1.0);

  static TextStyle get filterChipCount => _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    height: 1.0,
    color: AppColors.textPrimary,
  );

  static TextStyle get filterOptionTitle =>
      _base.copyWith(fontSize: 14, fontWeight: FontWeight.w600, height: 1.1);

  static TextStyle get filterOptionSubtitle => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColors.textPrimary,
  );

  static TextStyle get avatarName => _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
  );

  static TextStyle get avatarSubtitle => _base.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    height: 1.0,
  );

  static TextStyle get buttonLabel => _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    height: 1.0,
    color: AppColors.white,
  );
}
