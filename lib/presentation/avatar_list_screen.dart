import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_strings.dart';
import '../core/utils/filter_display_helper.dart';
import '../domain/entities/age_group.dart';
import '../domain/entities/gender.dart';
import '../domain/entities/pose.dart';
import 'controllers/avatar_list_controller.dart';
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
  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: const AvatarListAppBar(),
      body: Consumer<AvatarListController>(
        builder:
            (context, controller, _) => Column(
              children: [
                FilterBar(
                  filter: controller.filter,
                  hasActiveFilters: controller.hasActiveFilters,
                  onClearFilters: controller.clearAllFilters,
                  onGenderTap: () => _showGenderFilter(controller),
                  onAgeTap: () => _showAgeFilter(controller),
                  onPoseTap: () => _showPoseFilter(controller),
                ),
                Expanded(
                  child:
                      controller.hasResults
                          ? AvatarGrid(avatars: controller.avatars)
                          : EmptyStateView(
                            onClearFilters: controller.clearAllFilters,
                          ),
                ),
              ],
            ),
      ),
    );
  }

  void _initController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AvatarListController>().init();
    });
  }

  void _showGenderFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterPopup.show<Gender>(
      context: context,
      title: AppStrings.gender,
      options: Gender.values,
      selectedOptionsSelector: (c) => c.pendingFilter.genders,
      labelBuilder: FilterDisplayHelper.getGenderLabel,
      onToggle: controller.toggleGender,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
      controller: controller,
    );
  }

  void _showAgeFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterPopup.show<AgeGroup>(
      context: context,
      title: AppStrings.age,
      options: AgeGroup.values,
      selectedOptionsSelector: (c) => c.pendingFilter.ageGroups,
      labelBuilder: FilterDisplayHelper.getAgeGroupLabel,
      subtitleBuilder: FilterDisplayHelper.getAgeGroupRange,
      onToggle: controller.toggleAgeGroup,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
      controller: controller,
    );
  }

  void _showPoseFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterPopup.show<Pose>(
      context: context,
      title: AppStrings.pose,
      options: Pose.values,
      selectedOptionsSelector: (c) => c.pendingFilter.poses,
      labelBuilder: FilterDisplayHelper.getPoseLabel,
      onToggle: controller.togglePose,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
      controller: controller,
    );
  }
}
