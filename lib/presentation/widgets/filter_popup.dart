import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../controllers/avatar_list_controller.dart';
import 'filter_option_tile.dart';
import 'primary_button.dart';

class FilterPopup<T> extends StatelessWidget {
  final String title;
  final List<T> options;
  final Set<T> Function(AvatarListController) selectedOptionsSelector;
  final String Function(T) labelBuilder;
  final String? Function(T)? subtitleBuilder;
  final void Function(T) onToggle;
  final VoidCallback onSave;
  final String saveLabel;
  final AvatarListController controller;

  const FilterPopup({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptionsSelector,
    required this.labelBuilder,
    required this.onToggle,
    required this.onSave,
    required this.saveLabel,
    required this.controller,
    this.subtitleBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Dialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Consumer<AvatarListController>(
            builder: (context, ctrl, _) {
              final selectedOptions = selectedOptionsSelector(ctrl);
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
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
                  const SizedBox(height: 16),
                  ...options.map(
                    (option) => FilterOptionTile(
                      title: labelBuilder(option),
                      subtitle: subtitleBuilder?.call(option),
                      isSelected: selectedOptions.contains(option),
                      onTap: () => onToggle(option),
                    ),
                  ),
                  const SizedBox(height: 24),
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
      ),
    );
  }

  static Future<void> show<T>({
    required BuildContext context,
    required String title,
    required List<T> options,
    required Set<T> Function(AvatarListController) selectedOptionsSelector,
    required String Function(T) labelBuilder,
    String? Function(T)? subtitleBuilder,
    required void Function(T) onToggle,
    required VoidCallback onSave,
    required String saveLabel,
    required AvatarListController controller,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: title,
      barrierColor: AppColors.overlay,
      transitionDuration: AppConstants.animationNormal,
      pageBuilder: (context, animation, secondaryAnimation) => FilterPopup<T>(
        title: title,
        options: options,
        selectedOptionsSelector: selectedOptionsSelector,
        labelBuilder: labelBuilder,
        subtitleBuilder: subtitleBuilder,
        onToggle: onToggle,
        onSave: onSave,
        saveLabel: saveLabel,
        controller: controller,
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
