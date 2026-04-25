import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/core/constants/app_colors.dart';
import 'package:preptrak/data/content/android_track.dart';
import 'package:preptrak/data/content/flutter_track.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';
import 'package:preptrak/domain/entities/track.dart';
import 'package:preptrak/presentation/providers/progress_provider.dart';
import 'package:preptrak/presentation/providers/track_provider.dart';
import 'package:preptrak/presentation/topic_detail/topic_detail_sheet.dart';

class RoadmapScreen extends ConsumerStatefulWidget {
  const RoadmapScreen({super.key});

  @override
  ConsumerState<RoadmapScreen> createState() => _RoadmapScreenState();
}

class _RoadmapScreenState extends ConsumerState<RoadmapScreen> {
  final _expandedPhases = <String>{};
  bool _initialized = false;

  @override
  Widget build(BuildContext context) {
    final trackId = ref.watch(selectedTrackProvider);
    final progress = ref.watch(progressProvider);
    final track = trackId == 'android' ? androidTrack : flutterTrack;

    if (!_initialized && track.phases.isNotEmpty) {
      _expandedPhases.add(track.phases.first.id);
      _initialized = true;
    }

    return Scaffold(
      appBar: AppBar(title: Text('${track.name} Roadmap')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: track.phases.length,
        itemBuilder: (context, index) {
          final phase = track.phases[index];
          return _PhaseCard(
            phase: phase,
            progress: progress,
            isExpanded: _expandedPhases.contains(phase.id),
            onToggle: () => setState(() {
              if (_expandedPhases.contains(phase.id)) {
                _expandedPhases.remove(phase.id);
              } else {
                _expandedPhases.add(phase.id);
              }
            }),
          );
        },
      ),
    );
  }
}

class _PhaseCard extends StatelessWidget {
  const _PhaseCard({
    required this.phase,
    required this.progress,
    required this.isExpanded,
    required this.onToggle,
  });

  final Phase phase;
  final Map<String, TopicProgress> progress;
  final bool isExpanded;
  final VoidCallback onToggle;

  Color _priorityColor() => switch (phase.priority) {
        'highest' => AppColors.priorityHighest,
        'high' => AppColors.priorityHigh,
        'medium' => AppColors.priorityMedium,
        _ => AppColors.priorityLow,
      };

  @override
  Widget build(BuildContext context) {
    final doneCount = phase.topics
        .where((t) => progress[t.id]?.status == TopicStatus.done)
        .length;
    final percent =
        phase.topics.isEmpty ? 0.0 : doneCount / phase.topics.length;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          InkWell(
            onTap: onToggle,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: _priorityColor(),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          phase.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Text(
                        '$doneCount/${phase.topics.length}',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withAlpha(153),
                            ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        isExpanded
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(153),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    phase.weekRange,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(128),
                        ),
                  ),
                  const SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: percent,
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isExpanded) ...[
            const Divider(height: 1),
            ...phase.topics.map(
              (topic) => _TopicTile(
                topic: topic,
                progress: progress[topic.id],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TopicTile extends StatelessWidget {
  const _TopicTile({required this.topic, required this.progress});

  final Topic topic;
  final TopicProgress? progress;

  @override
  Widget build(BuildContext context) {
    final status = progress?.status ?? TopicStatus.notStarted;
    final (icon, color) = switch (status) {
      TopicStatus.done => (
          Icons.check_circle_rounded,
          Theme.of(context).colorScheme.primary,
        ),
      TopicStatus.inProgress => (
          Icons.radio_button_checked,
          Colors.orange,
        ),
      _ => (
          Icons.radio_button_unchecked,
          Theme.of(context).colorScheme.onSurface.withAlpha(77),
        ),
    };

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(topic.name),
      subtitle: Text(
        '${topic.subtopics.length} subtopics',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        useSafeArea: true,
        builder: (_) => TopicDetailSheet(topic: topic, progress: progress),
      ),
    );
  }
}
