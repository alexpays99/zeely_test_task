import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/utils/filter_display_helper.dart';
import '../../domain/entities/gender.dart';
import '../../domain/entities/age_group.dart';
import '../../domain/entities/pose.dart';
import '../controllers/avatar_list_controller.dart';
import '../widgets/avatar_grid_item.dart';
import '../widgets/empty_state_view.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/filter_chip_button.dart';

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

  void _initController() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AvatarListController>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildFilterBar(),
          const Divider(height: 1, color: AppColors.divider),
          Expanded(child: _buildContent()),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, size: 20),
        onPressed: () {},
      ),
      title: const Text(AppStrings.allAvatars),
    );
  }

  Widget _buildFilterBar() {
    return Consumer<AvatarListController>(
      builder: (context, controller, _) {
        final filter = controller.filter;
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              if (controller.hasActiveFilters) ...[
                GestureDetector(
                  onTap: controller.clearAllFilters,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: AppColors.chipBackground,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.iconColor,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
              ],
              FilterChipButton(
                label: AppStrings.gender,
                isActive: filter.genders.isNotEmpty,
                activeCount: filter.genders.length,
                onTap: () => _showGenderFilter(controller),
              ),
              const SizedBox(width: 8),
              FilterChipButton(
                label: AppStrings.age,
                isActive: filter.ageGroups.isNotEmpty,
                activeCount: filter.ageGroups.length,
                onTap: () => _showAgeFilter(controller),
              ),
              const SizedBox(width: 8),
              FilterChipButton(
                label: AppStrings.pose,
                isActive: filter.poses.isNotEmpty,
                activeCount: filter.poses.length,
                onTap: () => _showPoseFilter(controller),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent() {
    return Consumer<AvatarListController>(
      builder: (context, controller, _) {
        if (!controller.hasResults) {
          return EmptyStateView(
            onClearFilters: controller.clearAllFilters,
          );
        }
        return _buildAvatarGrid(controller);
      },
    );
  }

  Widget _buildAvatarGrid(AvatarListController controller) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.75,
      ),
      itemCount: controller.avatars.length,
      itemBuilder: (context, index) => AvatarGridItem(
        avatar: controller.avatars[index],
      ),
    );
  }

  void _showGenderFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterBottomSheet.show<Gender>(
      context: context,
      title: AppStrings.gender,
      options: Gender.values,
      selectedOptions: controller.pendingFilter.genders,
      labelBuilder: FilterDisplayHelper.getGenderLabel,
      onToggle: controller.toggleGender,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
    );
  }

  void _showAgeFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterBottomSheet.show<AgeGroup>(
      context: context,
      title: AppStrings.age,
      options: AgeGroup.values,
      selectedOptions: controller.pendingFilter.ageGroups,
      labelBuilder: FilterDisplayHelper.getAgeGroupLabel,
      subtitleBuilder: FilterDisplayHelper.getAgeGroupRange,
      onToggle: controller.toggleAgeGroup,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
    );
  }

  void _showPoseFilter(AvatarListController controller) {
    controller.startEditingFilter();
    FilterBottomSheet.show<Pose>(
      context: context,
      title: AppStrings.pose,
      options: Pose.values,
      selectedOptions: controller.pendingFilter.poses,
      labelBuilder: FilterDisplayHelper.getPoseLabel,
      onToggle: controller.togglePose,
      onSave: controller.applyFilter,
      saveLabel: AppStrings.save,
    );
  }
}
