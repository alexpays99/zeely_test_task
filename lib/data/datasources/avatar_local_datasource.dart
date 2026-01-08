import '../../domain/entities/avatar.dart';
import '../../domain/entities/gender.dart';
import '../../domain/entities/age_group.dart';
import '../../domain/entities/pose.dart';

abstract interface class AvatarLocalDatasource {
  List<Avatar> getAvatars();
}

final class AvatarLocalDatasourceImpl implements AvatarLocalDatasource {
  @override
  List<Avatar> getAvatars() => _mockAvatars;

  static const List<Avatar> _mockAvatars = [
    Avatar(
      id: '1',
      name: 'Alexander',
      imageUrl: 'assets/images/avatar_1.png',
      gender: Gender.man,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.standing,
    ),
    Avatar(
      id: '2',
      name: 'Mary',
      imageUrl: 'assets/images/avatar_2.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '3',
      name: 'Tim',
      imageUrl: 'assets/images/avatar_3.png',
      gender: Gender.man,
      ageGroup: AgeGroup.adults,
      pose: Pose.standing,
      isPremium: true,
    ),
    Avatar(
      id: '4',
      name: 'Sarah',
      imageUrl: 'assets/images/avatar_4.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.adults,
      pose: Pose.sitting,
    ),
    Avatar(
      id: '5',
      name: 'James',
      imageUrl: 'assets/images/avatar_5.png',
      gender: Gender.man,
      ageGroup: AgeGroup.middleAgedAdults,
      pose: Pose.carSelfie,
    ),
    Avatar(
      id: '6',
      name: 'Emily',
      imageUrl: 'assets/images/avatar_6.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.walking,
    ),
    Avatar(
      id: '7',
      name: 'David',
      imageUrl: 'assets/images/avatar_7.png',
      gender: Gender.man,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '8',
      name: 'Anna',
      imageUrl: 'assets/images/avatar_8.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.middleAgedAdults,
      pose: Pose.standing,
      isPremium: true,
    ),
    Avatar(
      id: '9',
      name: 'Michael',
      imageUrl: 'assets/images/avatar_9.png',
      gender: Gender.man,
      ageGroup: AgeGroup.olderAdults,
      pose: Pose.sitting,
    ),
    Avatar(
      id: '10',
      name: 'Jessica',
      imageUrl: 'assets/images/avatar_10.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '11',
      name: 'Robert',
      imageUrl: 'assets/images/avatar_11.png',
      gender: Gender.man,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.walking,
    ),
    Avatar(
      id: '12',
      name: 'Linda',
      imageUrl: 'assets/images/avatar_12.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.olderAdults,
      pose: Pose.standing,
    ),
    Avatar(
      id: '13',
      name: 'William',
      imageUrl: 'assets/images/avatar_13.png',
      gender: Gender.man,
      ageGroup: AgeGroup.middleAgedAdults,
      pose: Pose.selfie,
      isPremium: true,
    ),
    Avatar(
      id: '14',
      name: 'Patricia',
      imageUrl: 'assets/images/avatar_14.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.carSelfie,
    ),
    Avatar(
      id: '15',
      name: 'Thomas',
      imageUrl: 'assets/images/avatar_15.png',
      gender: Gender.man,
      ageGroup: AgeGroup.adults,
      pose: Pose.standing,
    ),
    Avatar(
      id: '16',
      name: 'Jennifer',
      imageUrl: 'assets/images/avatar_16.png',
      gender: Gender.woman,
      ageGroup: AgeGroup.middleAgedAdults,
      pose: Pose.sitting,
    ),
  ];
}
