import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:preptrak/core/constants/app_colors.dart';
import 'package:preptrak/presentation/providers/track_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 64),
              Text(
                'PrepTrack',
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose your interview track to get a structured roadmap with clear pass conditions per topic.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withAlpha(178),
                    ),
              ),
              const SizedBox(height: 48),
              _TrackCard(
                id: 'flutter',
                title: 'Flutter Engineer',
                subtitle: '4 phases · 15 topics',
                detail: 'Widgets, Dart, Architecture, Testing',
                icon: Icons.phone_android_rounded,
                color: AppColors.flutterBlue,
                onTap: (id) => _selectTrack(context, ref, id),
              ),
              const SizedBox(height: 16),
              _TrackCard(
                id: 'android',
                title: 'Android Engineer',
                subtitle: '4 phases · 14 topics',
                detail: 'Compose, Coroutines, Hilt, Architecture',
                icon: Icons.android_rounded,
                color: AppColors.androidGreen,
                onTap: (id) => _selectTrack(context, ref, id),
              ),
              const Spacer(),
              Center(
                child: Text(
                  'DSA roadmap is included with both tracks.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withAlpha(128),
                      ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectTrack(
    BuildContext context,
    WidgetRef ref,
    String trackId,
  ) async {
    await ref.read(progressRepositoryProvider).saveSelectedTrack(trackId);
    ref.read(selectedTrackProvider.notifier).state = trackId;
    if (context.mounted) context.go('/dashboard');
  }
}

class _TrackCard extends StatelessWidget {
  const _TrackCard({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.detail,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String id;
  final String title;
  final String subtitle;
  final String detail;
  final IconData icon;
  final Color color;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => onTap(id),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: color.withAlpha(38),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .primary,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      detail,
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
              Icon(
                Icons.chevron_right,
                color:
                    Theme.of(context).colorScheme.onSurface.withAlpha(102),
              ),
            ],
          ),
        ),
      ),
    );
  }
}