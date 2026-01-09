import '../../domain/entities/age_group.dart';
import '../../domain/entities/gender.dart';
import '../../domain/entities/pose.dart';
import '../constants/app_strings.dart';

extension GenderDisplayExtension on Gender {
  String get label => switch (this) {
    Gender.man => AppStrings.man,
    Gender.woman => AppStrings.woman,
  };

  String get shortLabel => switch (this) {
    Gender.man => AppStrings.male,
    Gender.woman => AppStrings.female,
  };
}

extension AgeGroupDisplayExtension on AgeGroup {
  String get label => switch (this) {
    AgeGroup.youngAdults => AppStrings.youngAdults,
    AgeGroup.adults => AppStrings.adults,
    AgeGroup.middleAgedAdults => AppStrings.middleAgedAdults,
    AgeGroup.olderAdults => AppStrings.olderAdults,
  };

  String get range => switch (this) {
    AgeGroup.youngAdults => AppStrings.youngAdultsRange,
    AgeGroup.adults => AppStrings.adultsRange,
    AgeGroup.middleAgedAdults => AppStrings.middleAgedAdultsRange,
    AgeGroup.olderAdults => AppStrings.olderAdultsRange,
  };
}

extension PoseDisplayExtension on Pose {
  String get label => switch (this) {
    Pose.standing => AppStrings.standing,
    Pose.sitting => AppStrings.sitting,
    Pose.selfie => AppStrings.selfie,
    Pose.carSelfie => AppStrings.carSelfie,
    Pose.walking => AppStrings.walking,
  };
}
