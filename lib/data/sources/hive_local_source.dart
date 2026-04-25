import 'package:hive_flutter/hive_flutter.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';

const _kSettingsBox = 'settings';
const _kProgressBox = 'progress';
const _kSelectedTrackKey = 'selectedTrack';

class HiveLocalSource {
  Box<String> get _settings => Hive.box<String>(_kSettingsBox);
  Box<TopicProgress> get _progress => Hive.box<TopicProgress>(_kProgressBox);

  String? getSelectedTrack() => _settings.get(_kSelectedTrackKey);

  Future<void> saveSelectedTrack(String trackId) =>
      _settings.put(_kSelectedTrackKey, trackId);

  TopicProgress? getTopicProgress(String topicId) => _progress.get(topicId);

  Map<String, TopicProgress> getAllProgress() => {
        for (final key in _progress.keys) key.toString(): _progress.get(key)!,
      };

  Future<void> saveTopicProgress(TopicProgress progress) =>
      _progress.put(progress.topicId, progress);

  Future<void> clearAllProgress() => _progress.clear();
}