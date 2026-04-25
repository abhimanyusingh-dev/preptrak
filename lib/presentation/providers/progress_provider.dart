import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';
import 'package:preptrak/presentation/providers/track_provider.dart';

class ProgressNotifier extends Notifier<Map<String, TopicProgress>> {
  @override
  Map<String, TopicProgress> build() =>
      ref.watch(progressRepositoryProvider).getAllProgress();

  Future<void> updateStatus(String topicId, TopicStatus status) async {
    await ref.read(progressRepositoryProvider).updateTopicStatus(topicId, status);
    state = Map.from(ref.read(progressRepositoryProvider).getAllProgress());
  }

  Future<void> updateNotes(String topicId, String notes) async {
    await ref.read(progressRepositoryProvider).updateTopicNotes(topicId, notes);
    state = Map.from(ref.read(progressRepositoryProvider).getAllProgress());
  }

  Future<void> resetAll() async {
    await ref.read(progressRepositoryProvider).resetAllProgress();
    state = {};
  }
}

final progressProvider =
    NotifierProvider<ProgressNotifier, Map<String, TopicProgress>>(
  ProgressNotifier.new,
);