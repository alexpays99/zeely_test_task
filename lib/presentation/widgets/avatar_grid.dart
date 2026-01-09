import 'package:flutter/material.dart';

import '../../domain/entities/avatar.dart';
import 'avatar_grid_item.dart';

class AvatarGrid extends StatelessWidget {
  const AvatarGrid({super.key, required this.avatars});
  final List<Avatar> avatars;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 0.70,
      ),
      itemCount: avatars.length,
      itemBuilder: (context, index) => AvatarGridItem(avatar: avatars[index]),
    );
  }
}
