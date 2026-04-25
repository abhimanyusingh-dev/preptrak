import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:preptrak/presentation/dashboard/dashboard_screen.dart';
import 'package:preptrak/presentation/dsa/dsa_screen.dart';
import 'package:preptrak/presentation/onboarding/onboarding_screen.dart';
import 'package:preptrak/presentation/providers/track_provider.dart';
import 'package:preptrak/presentation/roadmap/roadmap_screen.dart';
import 'package:preptrak/presentation/settings/settings_screen.dart';
import 'package:preptrak/presentation/shell/shell_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final selectedTrack = ref.read(selectedTrackProvider);

  return GoRouter(
    initialLocation: selectedTrack == null ? '/onboarding' : '/dashboard',
    routes: [
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/dashboard',
            builder: (context, state) => const DashboardScreen(),
          ),
          GoRoute(
            path: '/roadmap',
            builder: (context, state) => const RoadmapScreen(),
          ),
          GoRoute(
            path: '/dsa',
            builder: (context, state) => const DSAScreen(),
          ),
          GoRoute(
            path: '/settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
  );
});