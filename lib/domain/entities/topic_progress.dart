enum TopicStatus { notStarted, inProgress, done }

class TopicProgress {
  const TopicProgress({
    required this.topicId,
    this.status = TopicStatus.notStarted,
    this.userNotes,
    this.completedAt,
  });

  final String topicId;
  final TopicStatus status;
  final String? userNotes;
  final DateTime? completedAt;

  TopicProgress copyWith({
    TopicStatus? status,
    String? userNotes,
    DateTime? completedAt,
  }) =>
      TopicProgress(
        topicId: topicId,
        status: status ?? this.status,
        userNotes: userNotes ?? this.userNotes,
        completedAt: completedAt ?? this.completedAt,
      );
}