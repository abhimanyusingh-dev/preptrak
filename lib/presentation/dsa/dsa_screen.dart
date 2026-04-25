import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/data/content/dsa_track.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';
import 'package:preptrak/presentation/providers/progress_provider.dart';
import 'package:preptrak/presentation/topic_detail/topic_detail_sheet.dart';

class DSAScreen extends ConsumerWidget {
  const DSAScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = ref.watch(progressProvider);

    final totalTopics = dsaTrack.phases.expand((p) => p.topics).length;
    final doneTopics = dsaTrack.phases
        .expand((p) => p.topics)
        .where((t) => progress[t.id]?.status == TopicStatus.done)
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DSA Track'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Chip(
              label: Text(
                '$doneTopics / $totalTopics done',
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: dsaTrack.phases.length,
        itemBuilder: (context, index) {
          final phase = dsaTrack.phases[index];
          final phaseDone = phase.topics
              .where((t) => progress[t.id]?.status == TopicStatus.done)
              .length;

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            clipBehavior: Clip.antiAlias,
            child: ExpansionTile(
              title: Text(
                phase.name,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '${phase.weekRange} · $phaseDone/${phase.topics.length} done',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              children: phase.topics.map((topic) {
                final topicProgress = progress[topic.id];
                final status =
                    topicProgress?.status ?? TopicStatus.notStarted;
                final isDone = status == TopicStatus.done;

                return ListTile(
                  leading: Icon(
                    isDone
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked,
                    color: isDone
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(77),
                  ),
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
                    builder: (_) => TopicDetailSheet(
                      topic: topic,
                      progress: topicProgress,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        },
      ),
    );
  }
}
