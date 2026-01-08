import '../../domain/entities/age_group.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/entities/gender.dart';
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
      name: 'Jennifer',
      imageUrl: 'assets/images/jennifer.png',
      gender: Gender.woman,
      age: 21,
      ageGroup: AgeGroup.youngAdults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '2',
      name: 'Mary',
      imageUrl: 'assets/images/mary.png',
      gender: Gender.woman,
      age: 38,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '3',
      name: 'Tim',
      imageUrl: 'assets/images/tim.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
      isPremium: true,
    ),
    Avatar(
      id: '4',
      name: 'Tim',
      imageUrl: 'assets/images/tim_2.png',
      gender: Gender.man,
      age: 28,
      ageGroup: AgeGroup.adults,
      pose: Pose.standing,
    ),
    Avatar(
      id: '5',
      name: 'Tim',
      imageUrl: 'assets/images/tim_3.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.sitting,
    ),
    Avatar(
      id: '6',
      name: 'Tim',
      imageUrl: 'assets/images/tim_4.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.standing,
      isPremium: true,
    ),
    Avatar(
      id: '7',
      name: 'Tim',
      imageUrl: 'assets/images/tim_5.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.walking,
    ),
    Avatar(
      id: '8',
      name: 'Tim',
      imageUrl: 'assets/images/tim_6.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
    ),
    Avatar(
      id: '9',
      name: 'Tim',
      imageUrl: 'assets/images/tim_2.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.carSelfie,
    ),
    Avatar(
      id: '10',
      name: 'Tim',
      imageUrl: 'assets/images/tim_3.png',
      gender: Gender.man,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.standing,
    ),
    Avatar(
      id: '11',
      name: 'Tim',
      imageUrl: 'assets/images/tim_4.png',
      gender: Gender.woman,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.sitting,
    ),
    Avatar(
      id: '12',
      name: 'Tim',
      imageUrl: 'assets/images/tim_5.png',
      gender: Gender.woman,
      age: 29,
      ageGroup: AgeGroup.adults,
      pose: Pose.selfie,
    ),
  ];
}
