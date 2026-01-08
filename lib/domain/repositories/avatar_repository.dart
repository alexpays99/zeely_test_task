import '../entities/avatar.dart';
import '../entities/avatar_filter.dart';

abstract interface class AvatarRepository {
  List<Avatar> getAvatars();
  List<Avatar> getFilteredAvatars(AvatarFilter filter);
}
