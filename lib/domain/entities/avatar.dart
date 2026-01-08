import 'gender.dart';
import 'age_group.dart';
import 'pose.dart';

class Avatar {
  final String id;
  final String name;
  final String imageUrl;
  final Gender gender;
  final AgeGroup ageGroup;
  final Pose pose;
  final bool isPremium;

  const Avatar({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.ageGroup,
    required this.pose,
    this.isPremium = false,
  });
}
