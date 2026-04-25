import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:preptrak/core/router/app_router.dart';
import 'package:preptrak/core/theme/app_theme.dart';
import 'package:preptrak/data/models/topic_progress_adapter.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TopicProgressAdapter());
  await Hive.openBox<String>('settings');
  await Hive.openBox<TopicProgress>('progress');
  runApp(const ProviderScope(child: PrepTrackApp()));
}

class PrepTrackApp extends ConsumerWidget {
  const PrepTrackApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      title: 'PrepTrack',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
