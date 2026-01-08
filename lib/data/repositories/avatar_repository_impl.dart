import '../../domain/entities/avatar.dart';
import '../../domain/entities/avatar_filter.dart';
import '../../domain/repositories/avatar_repository.dart';
import '../datasources/avatar_local_datasource.dart';

final class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarLocalDatasource _datasource;

  const AvatarRepositoryImpl(this._datasource);

  @override
  List<Avatar> getAvatars() => _datasource.getAvatars();

  @override
  List<Avatar> getFilteredAvatars(AvatarFilter filter) {
    if (filter.isEmpty) return getAvatars();

    return getAvatars().where((avatar) {
      final matchesGender = filter.genders.isEmpty || 
          filter.genders.contains(avatar.gender);
      final matchesAge = filter.ageGroups.isEmpty || 
          filter.ageGroups.contains(avatar.ageGroup);
      final matchesPose = filter.poses.isEmpty || 
          filter.poses.contains(avatar.pose);

      return matchesGender && matchesAge && matchesPose;
    }).toList();
  }
}
