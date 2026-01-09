import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'data/datasources/avatar_local_datasource.dart';
import 'data/repositories/avatar_repository_impl.dart';
import 'presentation/avatar_list_screen.dart';
import 'presentation/providers/avatar_list_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zeely Test',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: ChangeNotifierProvider(
        create:
            (_) => AvatarListProvider(
              AvatarRepositoryImpl(AvatarLocalDatasourceImpl()),
            ),
        child: const AvatarListScreen(),
      ),
    );
  }
}
