class Resource {
  const Resource({required this.title, required this.url});

  final String title;
  final String url;
}

class Topic {
  const Topic({
    required this.id,
    required this.name,
    required this.subtopics,
    required this.passCondition,
    this.resources = const [],
  });

  final String id;
  final String name;
  final List<String> subtopics;
  final String passCondition;
  final List<Resource> resources;
}

class Phase {
  const Phase({
    required this.id,
    required this.name,
    required this.weekRange,
    required this.priority,
    required this.topics,
  });

  final String id;
  final String name;
  final String weekRange;

  /// 'highest' | 'high' | 'medium' | 'good_to_have'
  final String priority;
  final List<Topic> topics;
}

class Track {
  const Track({
    required this.id,
    required this.name,
    required this.description,
    required this.phases,
  });

  final String id;
  final String name;
  final String description;
  final List<Phase> phases;
}