import '../../domain/entities/age_group.dart';
import '../../domain/entities/gender.dart';
import '../../domain/entities/pose.dart';
import '../constants/app_strings.dart';

abstract final class FilterDisplayHelper {
  static String getGenderLabel(Gender gender) => switch (gender) {
    Gender.man => AppStrings.man,
    Gender.woman => AppStrings.woman,
  };

  static String getGenderShortLabel(Gender gender) => switch (gender) {
    Gender.man => AppStrings.male,
    Gender.woman => AppStrings.female,
  };

  static String getAgeGroupLabel(AgeGroup ageGroup) => switch (ageGroup) {
    AgeGroup.youngAdults => AppStrings.youngAdults,
    AgeGroup.adults => AppStrings.adults,
    AgeGroup.middleAgedAdults => AppStrings.middleAgedAdults,
    AgeGroup.olderAdults => AppStrings.olderAdults,
  };

  static String getAgeGroupRange(AgeGroup ageGroup) => switch (ageGroup) {
    AgeGroup.youngAdults => AppStrings.youngAdultsRange,
    AgeGroup.adults => AppStrings.adultsRange,
    AgeGroup.middleAgedAdults => AppStrings.middleAgedAdultsRange,
    AgeGroup.olderAdults => AppStrings.olderAdultsRange,
  };

  static String getPoseLabel(Pose pose) => switch (pose) {
    Pose.standing => AppStrings.standing,
    Pose.sitting => AppStrings.sitting,
    Pose.selfie => AppStrings.selfie,
    Pose.carSelfie => AppStrings.carSelfie,
    Pose.walking => AppStrings.walking,
  };
}
