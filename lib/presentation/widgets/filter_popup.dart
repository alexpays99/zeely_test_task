import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_text_styles.dart';
import '../controllers/avatar_list_provider.dart';
import 'filter_option_tile.dart';
import 'primary_button.dart';

class FilterPopup<T> extends StatelessWidget {
  const FilterPopup({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptionsSelector,
    required this.labelBuilder,
    required this.onToggle,
    required this.onSave,
    required this.saveLabel,
    this.subtitleBuilder,
  });
  final String title;
  final List<T> options;
  final Set<T> Function(AvatarListProvider) selectedOptionsSelector;
  final String Function(T) labelBuilder;
  final String? Function(T)? subtitleBuilder;
  final void Function(T) onToggle;
  final VoidCallback onSave;
  final String saveLabel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Consumer<AvatarListProvider>(
          builder: (context, provider, _) {
            final selectedOptions = selectedOptionsSelector(provider);
            return Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: AppTextStyles.titleMedium),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.close,
                        color: AppColors.iconColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                ...options.map(
                  (option) => FilterOptionTile(
                    title: labelBuilder(option),
                    subtitle: subtitleBuilder?.call(option),
                    isSelected: selectedOptions.contains(option),
                    onTap: () => onToggle(option),
                  ),
                ),
                const SizedBox(height: 32),
                PrimaryButton(
                  label: saveLabel,
                  onPressed: () {
                    onSave();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  static Future<void> show<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    required Set<T> Function(AvatarListProvider) selectedOptionsSelector,
    required String Function(T) labelBuilder,
    String? Function(T)? subtitleBuilder,
    required void Function(T) onToggle,
    required VoidCallback onSave,
    required String saveLabel,
  }) {
    final provider = context.read<AvatarListProvider>();
    provider.startEditingFilter();

    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: title,
      barrierColor: AppColors.overlay,
      transitionDuration: AppConstants.animationNormal,
      pageBuilder:
          (_, _, _) => ChangeNotifierProvider.value(
            value: provider,
            child: FilterPopup<T>(
              title: title,
              options: options,
              selectedOptionsSelector: selectedOptionsSelector,
              labelBuilder: labelBuilder,
              subtitleBuilder: subtitleBuilder,
              onToggle: onToggle,
              onSave: onSave,
              saveLabel: saveLabel,
            ),
          ),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
            ),
            child: child,
          ),
        );
      },
    );
  }
}
