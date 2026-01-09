import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/utils/filter_display_helper.dart';
import '../domain/entities/age_group.dart';
import '../domain/entities/gender.dart';
import '../domain/entities/pose.dart';
import 'providers/avatar_list_provider.dart';
import 'widgets/avatar_grid.dart';
import 'widgets/avatar_list_app_bar.dart';
import 'widgets/empty_state_view.dart';
import 'widgets/filter_bar.dart';
import 'widgets/filter_popup.dart';

class AvatarListScreen extends StatefulWidget {
  const AvatarListScreen({super.key});

  @override
  State<AvatarListScreen> createState() => _AvatarListScreenState();
}

class _AvatarListScreenState extends State<AvatarListScreen> {
  late final AvatarListProvider _provider;

  @override
  void initState() {
    super.initState();
    _initProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AvatarListAppBar(),
      body: Consumer<AvatarListProvider>(
        builder:
            (context, provider, _) => Column(
              children: [
                FilterBar(
                  filter: provider.filter,
                  hasActiveFilters: provider.hasActiveFilters,
                  onClearFilters: provider.clearAllFilters,
                  onGenderTap: _showGenderFilter,
                  onAgeTap: _showAgeFilter,
                  onPoseTap: _showPoseFilter,
                ),
                Expanded(
                  child:
                      provider.hasResults
                          ? AvatarGrid(avatars: provider.avatars)
                          : EmptyStateView(
                            onClearFilters: provider.clearAllFilters,
                          ),
                ),
              ],
            ),
      ),
    );
  }

  void _initProvider() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider = context.read<AvatarListProvider>()..init();
    });
  }

  void _showGenderFilter() => _showFilter<Gender>(
    title: AppStrings.gender,
    options: Gender.values,
    selectedOptionsSelector: (p) => p.pendingFilter.genders,
    labelBuilder: (g) => g.label,
    onToggle: _provider.toggleGender,
  );

  void _showAgeFilter() => _showFilter<AgeGroup>(
    title: AppStrings.age,
    options: AgeGroup.values,
    selectedOptionsSelector: (p) => p.pendingFilter.ageGroups,
    labelBuilder: (a) => a.label,
    subtitleBuilder: (a) => a.range,
    onToggle: _provider.toggleAgeGroup,
  );

  void _showPoseFilter() => _showFilter<Pose>(
    title: AppStrings.pose,
    options: Pose.values,
    selectedOptionsSelector: (p) => p.pendingFilter.poses,
    labelBuilder: (p) => p.label,
    onToggle: _provider.togglePose,
  );

  void _showFilter<T>({
    required String title,
    required List<T> options,
    required Set<T> Function(AvatarListProvider) selectedOptionsSelector,
    required String Function(T) labelBuilder,
    required void Function(T) onToggle,
    String? Function(T)? subtitleBuilder,
  }) {
    FilterPopup.show<T>(
      context: context,
      title: title,
      options: options,
      selectedOptionsSelector: selectedOptionsSelector,
      labelBuilder: labelBuilder,
      subtitleBuilder: subtitleBuilder,
      onToggle: onToggle,
      onSave: _provider.applyFilter,
      saveLabel: AppStrings.save,
    );
  }
}
