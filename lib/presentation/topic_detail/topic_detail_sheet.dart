import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:preptrak/domain/entities/topic_progress.dart';
import 'package:preptrak/domain/entities/track.dart';
import 'package:preptrak/presentation/providers/progress_provider.dart';

class TopicDetailSheet extends ConsumerStatefulWidget {
  const TopicDetailSheet({
    super.key,
    required this.topic,
    required this.progress,
  });

  final Topic topic;
  final TopicProgress? progress;

  @override
  ConsumerState<TopicDetailSheet> createState() => _TopicDetailSheetState();
}

class _TopicDetailSheetState extends ConsumerState<TopicDetailSheet> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(
      text: widget.progress?.userNotes ?? '',
    );
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final progress = ref.watch(progressProvider)[widget.topic.id];
    final status = progress?.status ?? TopicStatus.notStarted;

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      maxChildSize: 0.95,
      minChildSize: 0.5,
      expand: false,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withAlpha(51),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.topic.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const _SectionLabel(label: 'What to study'),
                    const SizedBox(height: 8),
                    ...widget.topic.subtopics.map(
                      (s) => Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '•  ',
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Expanded(child: Text(s)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const _SectionLabel(label: 'Pass Condition'),
                    const SizedBox(height: 8),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.topic.passCondition,
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimaryContainer,
                        ),
                      ),
                    ),
                    if (widget.topic.resources.isNotEmpty) ...[
                      const SizedBox(height: 20),
                      const _SectionLabel(label: 'Resources'),
                      const SizedBox(height: 8),
                      ...widget.topic.resources.map(
                        (r) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(
                            children: [
                              Icon(
                                Icons.link,
                                size: 16,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  r.title,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                    const SizedBox(height: 20),
                    const _SectionLabel(label: 'My Notes'),
                    const SizedBox(height: 8),
                    TextField(
                      controller: _notesController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                        hintText:
                            'Key insights, gotchas, or things to remember...',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) => ref
                          .read(progressProvider.notifier)
                          .updateNotes(widget.topic.id, value),
                    ),
                    const SizedBox(height: 24),
                    _StatusRow(topicId: widget.topic.id, status: status),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class _StatusRow extends ConsumerWidget {
  const _StatusRow({required this.topicId, required this.status});

  final String topicId;
  final TopicStatus status;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: status == TopicStatus.inProgress
                ? null
                : () => ref
                    .read(progressProvider.notifier)
                    .updateStatus(topicId, TopicStatus.inProgress),
            icon: const Icon(Icons.play_arrow_rounded),
            label: const Text('In Progress'),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: FilledButton.icon(
            onPressed: status == TopicStatus.done
                ? null
                : () {
                    ref
                        .read(progressProvider.notifier)
                        .updateStatus(topicId, TopicStatus.done);
                    Navigator.of(context).pop();
                  },
            icon: const Icon(Icons.check_rounded),
            label: const Text('Mark Done'),
          ),
        ),
      ],
    );
  }
}
