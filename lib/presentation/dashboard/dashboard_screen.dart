import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/data/content/android_track.dart';
import 'package:preptrak/data/content/dsa_track.dart';
import 'package:preptrak/data/content/flutter_track.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';
import 'package:preptrak/domain/entities/track.dart';
import 'package:preptrak/presentation/providers/progress_provider.dart';
import 'package:preptrak/presentation/providers/track_provider.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  List<Topic> _allTopics(Track track) =>
      track.phases.expand((p) => p.topics).toList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trackId = ref.watch(selectedTrackProvider);
    final progress = ref.watch(progressProvider);
    final track = trackId == 'android' ? androidTrack : flutterTrack;

    final trackTopics = _allTopics(track);
    final dsaTopics = _allTopics(dsaTrack);
    final allTopics = [...trackTopics, ...dsaTopics];

    final doneCount = allTopics
        .where((t) => progress[t.id]?.status == TopicStatus.done)
        .length;
    final percent =
        allTopics.isEmpty ? 0.0 : doneCount / allTopics.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('PrepTrack'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              label: Text(
                track.name,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _OverallProgressCard(
            doneCount: doneCount,
            totalCount: allTopics.length,
            percent: percent,
          ),
          const SizedBox(height: 20),
          Text(
            '${track.name} Progress',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          ...track.phases.map(
            (phase) => _PhaseProgressTile(phase: phase, progress: progress),
          ),
          const SizedBox(height: 12),
          Text(
            'DSA Progress',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          const SizedBox(height: 8),
          ...dsaTrack.phases.map(
            (phase) => _PhaseProgressTile(phase: phase, progress: progress),
          ),
        ],
      ),
    );
  }
}

class _OverallProgressCard extends StatelessWidget {
  const _OverallProgressCard({
    required this.doneCount,
    required this.totalCount,
    required this.percent,
  });

  final int doneCount;
  final int totalCount;
  final double percent;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${(percent * 100).round()}%',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Text(
              'Overall Progress',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withAlpha(153),
                  ),
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: percent,
                minHeight: 8,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$doneCount of $totalCount topics complete',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withAlpha(153),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PhaseProgressTile extends StatelessWidget {
  const _PhaseProgressTile({required this.phase, required this.progress});

  final Phase phase;
  final Map<String, TopicProgress> progress;

  @override
  Widget build(BuildContext context) {
    final doneCount = phase.topics
        .where((t) => progress[t.id]?.status == TopicStatus.done)
        .length;
    final percent =
        phase.topics.isEmpty ? 0.0 : doneCount / phase.topics.length;

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    phase.name,
                    style: Theme.of(context).textTheme.titleSmall,
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
              ],
            ),
            const SizedBox(height: 2),
            Text(
              phase.weekRange,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color:
                        Theme.of(context).colorScheme.onSurface.withAlpha(128),
                  ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(value: percent, minHeight: 6),
            ),
          ],
        ),
      ),
    );
  }
}
