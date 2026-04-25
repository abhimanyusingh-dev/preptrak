import 'package:preptrak/data/sources/hive_local_source.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';

abstract class ProgressRepository {
  String? getSelectedTrack();
  Future<void> saveSelectedTrack(String trackId);
  TopicProgress getOrCreateProgress(String topicId);
  Map<String, TopicProgress> getAllProgress();
  Future<void> updateTopicStatus(String topicId, TopicStatus status);
  Future<void> updateTopicNotes(String topicId, String notes);
  Future<void> resetAllProgress();
}

class HiveProgressRepository implements ProgressRepository {
  HiveProgressRepository(this._source);

  final HiveLocalSource _source;

  @override
  String? getSelectedTrack() => _source.getSelectedTrack();

  @override
  Future<void> saveSelectedTrack(String trackId) =>
      _source.saveSelectedTrack(trackId);

  @override
  TopicProgress getOrCreateProgress(String topicId) =>
      _source.getTopicProgress(topicId) ?? TopicProgress(topicId: topicId);

  @override
  Map<String, TopicProgress> getAllProgress() => _source.getAllProgress();

  @override
  Future<void> updateTopicStatus(String topicId, TopicStatus status) async {
    final existing = getOrCreateProgress(topicId);
    final updated = existing.copyWith(
      status: status,
      completedAt: status == TopicStatus.done
          ? DateTime.now()
          : existing.completedAt,
    );
    await _source.saveTopicProgress(updated);
  }

  @override
  Future<void> updateTopicNotes(String topicId, String notes) async {
    final existing = getOrCreateProgress(topicId);
    await _source.saveTopicProgress(existing.copyWith(userNotes: notes));
  }

  @override
  Future<void> resetAllProgress() => _source.clearAllProgress();
}