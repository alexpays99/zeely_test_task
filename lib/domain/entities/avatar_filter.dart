import 'gender.dart';
import 'age_group.dart';
import 'pose.dart';

class AvatarFilter {
  final Set<Gender> genders;
  final Set<AgeGroup> ageGroups;
  final Set<Pose> poses;

  const AvatarFilter({
    this.genders = const {},
    this.ageGroups = const {},
    this.poses = const {},
  });

  bool get isEmpty => genders.isEmpty && ageGroups.isEmpty && poses.isEmpty;
  
  bool get isNotEmpty => !isEmpty;

  int get activeCount => 
      (genders.isNotEmpty ? 1 : 0) + 
      (ageGroups.isNotEmpty ? 1 : 0) + 
      (poses.isNotEmpty ? 1 : 0);

  AvatarFilter copyWith({
    Set<Gender>? genders,
    Set<AgeGroup>? ageGroups,
    Set<Pose>? poses,
  }) {
    return AvatarFilter(
      genders: genders ?? this.genders,
      ageGroups: ageGroups ?? this.ageGroups,
      poses: poses ?? this.poses,
    );
  }

  AvatarFilter clearGenders() => copyWith(genders: {});
  AvatarFilter clearAgeGroups() => copyWith(ageGroups: {});
  AvatarFilter clearPoses() => copyWith(poses: {});
  
  static const AvatarFilter empty = AvatarFilter();
}
