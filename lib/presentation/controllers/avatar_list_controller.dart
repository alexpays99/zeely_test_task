import 'package:flutter/foundation.dart';

import '../../domain/entities/age_group.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/entities/avatar_filter.dart';
import '../../domain/entities/gender.dart';
import '../../domain/entities/pose.dart';
import '../../domain/repositories/avatar_repository.dart';

final class AvatarListController extends ChangeNotifier {
  final AvatarRepository _repository;

  AvatarFilter _filter = AvatarFilter.empty;
  AvatarFilter _pendingFilter = AvatarFilter.empty;
  List<Avatar> _avatars = [];
  List<Avatar> _filteredAvatars = [];

  AvatarListController(this._repository);

  AvatarFilter get filter => _filter;
  AvatarFilter get pendingFilter => _pendingFilter;
  List<Avatar> get avatars => _filteredAvatars;
  bool get hasActiveFilters => _filter.isNotEmpty;
  bool get hasResults => _filteredAvatars.isNotEmpty;

  void init() {
    _avatars = _repository.getAvatars();
    _filteredAvatars = _avatars;
  }

  void startEditingFilter() {
    _pendingFilter = _filter;
    notifyListeners();
  }

  void toggleGender(Gender gender) {
    final genders = Set<Gender>.from(_pendingFilter.genders);
    genders.contains(gender) ? genders.remove(gender) : genders.add(gender);
    _pendingFilter = _pendingFilter.copyWith(genders: genders);
    notifyListeners();
  }

  void toggleAgeGroup(AgeGroup ageGroup) {
    final ageGroups = Set<AgeGroup>.from(_pendingFilter.ageGroups);
    ageGroups.contains(ageGroup)
        ? ageGroups.remove(ageGroup)
        : ageGroups.add(ageGroup);
    _pendingFilter = _pendingFilter.copyWith(ageGroups: ageGroups);
    notifyListeners();
  }

  void togglePose(Pose pose) {
    final poses = Set<Pose>.from(_pendingFilter.poses);
    poses.contains(pose) ? poses.remove(pose) : poses.add(pose);
    _pendingFilter = _pendingFilter.copyWith(poses: poses);
    notifyListeners();
  }

  void applyFilter() {
    _filter = _pendingFilter;
    _filteredAvatars = _repository.getFilteredAvatars(_filter);
    notifyListeners();
  }

  void clearAllFilters() {
    _filter = AvatarFilter.empty;
    _pendingFilter = AvatarFilter.empty;
    _filteredAvatars = _avatars;
    notifyListeners();
  }

  void cancelEditing() {
    _pendingFilter = _filter;
    notifyListeners();
  }
}
