import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/data/repositories/progress_repository.dart';
import 'package:preptrak/data/sources/hive_local_source.dart';

final hiveLocalSourceProvider = Provider<HiveLocalSource>(
  (_) => HiveLocalSource(),
);

final progressRepositoryProvider = Provider<ProgressRepository>(
  (ref) => HiveProgressRepository(ref.watch(hiveLocalSourceProvider)),
);

/// Null means no track selected yet (onboarding not completed).
final selectedTrackProvider = StateProvider<String?>(
  (ref) => ref.watch(progressRepositoryProvider).getSelectedTrack(),
);