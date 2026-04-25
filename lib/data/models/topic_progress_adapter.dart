import 'package:hive_flutter/hive_flutter.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';

class TopicProgressAdapter extends TypeAdapter<TopicProgress> {
  @override
  final int typeId = 0;

  @override
  TopicProgress read(BinaryReader reader) {
    final topicId = reader.readString();
    final statusIndex = reader.readByte();
    final hasNotes = reader.readBool();
    final userNotes = hasNotes ? reader.readString() : null;
    final hasCompletedAt = reader.readBool();
    final completedAt = hasCompletedAt
        ? DateTime.fromMillisecondsSinceEpoch(reader.readInt())
        : null;
    return TopicProgress(
      topicId: topicId,
      status: TopicStatus.values[statusIndex],
      userNotes: userNotes,
      completedAt: completedAt,
    );
  }

  @override
  void write(BinaryWriter writer, TopicProgress obj) {
    writer.writeString(obj.topicId);
    writer.writeByte(obj.status.index);
    writer.writeBool(obj.userNotes != null);
    if (obj.userNotes != null) writer.writeString(obj.userNotes!);
    writer.writeBool(obj.completedAt != null);
    if (obj.completedAt != null) {
      writer.writeInt(obj.completedAt!.millisecondsSinceEpoch);
    }
  }
}