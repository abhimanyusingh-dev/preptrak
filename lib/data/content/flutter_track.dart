import 'package:preptrak/domain/entities/track.dart';

const flutterTrack = Track(
  id: 'flutter',
  name: 'Flutter Engineer',
  description: 'Roadmap for Flutter mobile engineer interviews',
  phases: [
    Phase(
      id: 'flutter_p1',
      name: 'Core Internals',
      weekRange: 'Weeks 1–3',
      priority: 'highest',
      topics: [
        Topic(
          id: 'flutter_widget_tree',
          name: 'Widget Tree & Rendering Pipeline',
          subtopics: [
            'Element tree vs Widget tree vs RenderObject tree',
            'Three-tree architecture and reconciliation',
            'BuildContext as a handle to the element tree',
            'Layout, paint, and compositing phases',
          ],
          passCondition:
              'Explain the three-tree architecture, draw a widget rebuild flow, and identify what triggers a RenderObject repaint — without notes.',
          resources: [
            Resource(
              title: 'Flutter Architectural Overview',
              url: 'https://docs.flutter.dev/resources/architectural-overview',
            ),
          ],
        ),
        Topic(
          id: 'flutter_lifecycle',
          name: 'StatelessWidget vs StatefulWidget Lifecycle',
          subtopics: [
            'Widget rebuild triggers and conditions',
            'Lifecycle: initState, didChangeDependencies, build, didUpdateWidget, dispose',
            'When to use StatelessWidget vs StatefulWidget',
            'Keys and their role in preserving state across rebuilds',
          ],
          passCondition:
              'Recite all lifecycle methods in order, explain when dispose is called, and write a widget that correctly uses didUpdateWidget — without notes.',
          resources: [
            Resource(
              title: 'State class — Flutter API Docs',
              url: 'https://api.flutter.dev/flutter/widgets/State-class.html',
            ),
          ],
        ),
        Topic(
          id: 'flutter_state_mgmt',
          name: 'State Management — Riverpod & BLoC',
          subtopics: [
            'Provider vs StateProvider vs NotifierProvider vs AsyncNotifierProvider',
            'Riverpod scoping, ProviderScope, and provider invalidation',
            'BLoC: Event → BLoC → State unidirectional flow',
            'When to choose Riverpod vs BLoC',
          ],
          passCondition:
              'Build a feature using AsyncNotifierProvider, explain provider invalidation, and describe when you\'d choose BLoC over Riverpod — without notes.',
          resources: [
            Resource(
              title: 'Why Riverpod — Official Docs',
              url: 'https://riverpod.dev/docs/introduction/why_riverpod',
            ),
            Resource(
              title: 'BLoC Library',
              url: 'https://bloclibrary.dev',
            ),
          ],
        ),
        Topic(
          id: 'flutter_keys',
          name: 'Keys in Flutter',
          subtopics: [
            'Why keys exist — identity vs equality in the element tree',
            'LocalKey: ValueKey, ObjectKey, UniqueKey',
            'GlobalKey and its use cases (form, scaffold, navigator)',
            'When keys are required (reorderable lists, animations)',
            'Key placement rule: must be on the same widget type',
          ],
          passCondition:
              'Explain why a list of stateful widgets needs keys, demo the bug that occurs without them, and write a fix — without notes.',
          resources: [
            Resource(
              title: 'Keys! — Flutter Widget of the Week',
              url: 'https://www.youtube.com/watch?v=kn0EOS-ZiIc',
            ),
          ],
        ),
        Topic(
          id: 'flutter_buildcontext',
          name: 'BuildContext & InheritedWidget',
          subtopics: [
            'BuildContext as a position in the element tree',
            'InheritedWidget and O(1) dependency lookup',
            'of() and maybeOf() pattern',
            'How Provider wraps InheritedWidget',
            'Why context.read() vs context.watch() matters in Riverpod',
          ],
          passCondition:
              'Write a custom InheritedWidget, explain why accessing context after an async gap is unsafe, and describe how Riverpod avoids InheritedWidget limitations — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'flutter_p2',
      name: 'Dart & Async',
      weekRange: 'Weeks 4–5',
      priority: 'high',
      topics: [
        Topic(
          id: 'flutter_event_loop',
          name: 'Event Loop & async/await',
          subtopics: [
            'Dart\'s single-threaded concurrency model',
            'Microtask queue vs event queue execution order',
            'Future chaining and error handling with catchError',
            'async/await desugaring and how it maps to Future',
            'Common mistakes: await in build(), unawaited futures',
          ],
          passCondition:
              'Predict execution order of a mixed microtask/event snippet, explain why await doesn\'t block the UI, and fix a missed-await bug — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_streams',
          name: 'Streams & StreamController',
          subtopics: [
            'Single-subscription vs broadcast streams',
            'StreamController: add, addError, close lifecycle',
            'StreamBuilder widget and its snapshot states',
            'Stream transformations: map, where, asyncMap, switchMap',
            'Cancelling subscriptions to avoid memory leaks',
          ],
          passCondition:
              'Build a StreamController-backed feature, explain single-subscription vs broadcast, and identify a stream leak in example code — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_isolates',
          name: 'Isolates & compute()',
          subtopics: [
            'Why Dart needs isolates (no shared memory model)',
            'Isolate.spawn vs compute() — when to use each',
            'SendPort / ReceivePort for inter-isolate communication',
            'Worker isolates for heavy computation',
            'What cannot be passed to an isolate (non-sendable types)',
          ],
          passCondition:
              'Explain when to use compute() vs Isolate.spawn, write a compute() call for a JSON parsing task, and describe what can\'t be sent to an isolate — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_null_safety',
          name: 'Null Safety & Type System',
          subtopics: [
            'Sound null safety — nullable vs non-nullable types',
            'Late variables, when to use them, and when they\'re dangerous',
            'Type promotion and the flow-based analysis',
            'Generics and the covariant keyword',
            'Extension methods and their limitations',
          ],
          passCondition:
              'Explain type promotion, write safe null coalescing chains, and explain when late throws a LateInitializationError — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'flutter_p3',
      name: 'Performance & Architecture',
      weekRange: 'Weeks 6–8',
      priority: 'medium',
      topics: [
        Topic(
          id: 'flutter_performance',
          name: 'Performance Optimization & DevTools',
          subtopics: [
            'Jank detection — the 16ms frame budget',
            'const constructors and their rebuild prevention',
            'RepaintBoundary for isolating subtrees from repaint',
            'ListView.builder vs ListView for large lists',
            'DevTools: timeline, memory, and CPU profiler workflows',
          ],
          passCondition:
              'Identify 3 performance issues in a provided widget tree, explain how RepaintBoundary helps, and describe the DevTools workflow to catch jank — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_architecture',
          name: 'Clean Architecture in Flutter',
          subtopics: [
            'Three-layer model: Data / Domain / Presentation',
            'Repository pattern and the dependency inversion principle',
            'Use cases (interactors) as single-responsibility classes',
            'Domain entities vs data models — why they differ',
            'Dependency injection with Riverpod providers',
          ],
          passCondition:
              'Draw the dependency rule diagram, explain why Presentation never imports Data directly, and walk through adding a feature end-to-end — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_navigation',
          name: 'Navigation & GoRouter + Deep Linking',
          subtopics: [
            'Navigator 1.0 vs Navigator 2.0 (declarative Router API)',
            'GoRouter: routes, redirect, ShellRoute for bottom nav',
            'Deep links: Android intent filters, iOS universal links',
            'Route guards and authentication-based redirects',
            'GoRouter error handling and 404 routes',
          ],
          passCondition:
              'Set up a GoRouter with ShellRoute for bottom nav, implement an auth redirect, and explain how deep link URI matching works — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'flutter_p4',
      name: 'Testing & Platform',
      weekRange: 'Weeks 9–11',
      priority: 'good_to_have',
      topics: [
        Topic(
          id: 'flutter_testing',
          name: 'Unit & Widget Testing',
          subtopics: [
            'Unit tests: pure Dart, no framework dependencies',
            'Widget tests: WidgetTester, pumpWidget, find, tap',
            'Mocking with Mockito or mocktail',
            'Testing Riverpod providers with ProviderContainer',
            'Golden tests for UI regression prevention',
          ],
          passCondition:
              'Write a unit test for a use case, a widget test with a Riverpod provider override, and explain what golden tests are good for — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_platform_channels',
          name: 'Platform Channels & FFI',
          subtopics: [
            'MethodChannel: Dart ↔ native bidirectional communication',
            'EventChannel for continuous streams from native',
            'BasicMessageChannel for raw message passing',
            'Flutter FFI for direct C/C++ interop',
            'When to use platform channels vs existing pub.dev packages',
          ],
          passCondition:
              'Describe the MethodChannel call flow end-to-end, write a basic MethodChannel handler in Kotlin, and explain when FFI is better — without notes.',
          resources: [],
        ),
        Topic(
          id: 'flutter_cicd',
          name: 'CI/CD & Release',
          subtopics: [
            'Flutter flavors for dev/staging/prod environments',
            'GitHub Actions: build, test, lint pipeline YAML',
            'Fastlane for automated Play Store / App Store delivery',
            'Build number management across environments',
            'Code signing for Android (keystore) and iOS (certificates)',
          ],
          passCondition:
              'Write a GitHub Actions YAML that runs flutter test and flutter build apk, explain flavors vs env vars, and describe the Play Store release flow — without notes.',
          resources: [],
        ),
      ],
    ),
  ],
);