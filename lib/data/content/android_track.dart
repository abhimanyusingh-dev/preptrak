import 'package:preptrak/domain/entities/track.dart';

const androidTrack = Track(
  id: 'android',
  name: 'Android Engineer (Kotlin)',
  description: 'Roadmap for Android engineer interviews using Kotlin and Jetpack',
  phases: [
    Phase(
      id: 'android_p1',
      name: 'Jetpack Compose & UI',
      weekRange: 'Weeks 1–3',
      priority: 'highest',
      topics: [
        Topic(
          id: 'android_compose_internals',
          name: 'Compose Internals & Recomposition',
          subtopics: [
            'Composable functions and the slot table (Gap Buffer)',
            'Recomposition triggers and stability contract',
            '@Stable and @Immutable annotations',
            'remember vs rememberSaveable',
            'Side effects: LaunchedEffect, DisposableEffect, SideEffect',
          ],
          passCondition:
              'Explain what triggers recomposition, fix an unstable lambda causing excess recomposition, and describe when to use LaunchedEffect vs DisposableEffect — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_viewmodel',
          name: 'ViewModel & StateFlow',
          subtopics: [
            'ViewModel lifecycle and scoping to Activity/Fragment/NavGraph',
            'StateFlow vs SharedFlow — replay and buffering',
            'UiState sealed class pattern',
            'collectAsStateWithLifecycle vs collectAsState',
            'SavedStateHandle for surviving process death',
          ],
          passCondition:
              'Build a ViewModel with StateFlow UiState, explain StateFlow vs SharedFlow, and handle process death with SavedStateHandle — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_coroutines',
          name: 'Coroutines & Structured Concurrency',
          subtopics: [
            'Coroutine builders: launch, async, runBlocking',
            'CoroutineScope, Job, and cancellation propagation',
            'Dispatchers: Main, IO, Default — when to use each',
            'Exception handling: CoroutineExceptionHandler, supervisorScope',
            'Flow vs Channel — push vs pull',
          ],
          passCondition:
              'Explain structured concurrency with a diagram, write a parallel network call with async/await, and handle cancellation correctly — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_flow',
          name: 'Kotlin Flow & Operators',
          subtopics: [
            'Cold vs hot flows — collection semantics',
            'Operators: map, filter, combine, zip, flatMapLatest',
            'StateFlow and SharedFlow internal differences',
            'Flow cancellation and exception propagation',
            'Testing flows with the Turbine library',
          ],
          passCondition:
              'Chain 3 Flow operators on a network response, explain cold vs hot, and write a test using Turbine — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'android_p2',
      name: 'Data Layer',
      weekRange: 'Weeks 4–5',
      priority: 'high',
      topics: [
        Topic(
          id: 'android_room',
          name: 'Room Database',
          subtopics: [
            'Entity, DAO, and Database setup',
            'Relations: @Embedded, @Relation, and junction tables',
            'Migration strategies: auto and manual',
            'Room + Flow for reactive queries',
            'Testing Room with an in-memory database',
          ],
          passCondition:
              'Define a Room schema with a one-to-many relation, write a reactive DAO query with Flow, and write a migration — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_hilt',
          name: 'Dependency Injection with Hilt',
          subtopics: [
            '@HiltAndroidApp and @AndroidEntryPoint setup',
            '@Module, @Provides, @Binds — when to use each',
            'Scoping: @Singleton, @ViewModelScoped, @ActivityScoped',
            'Hilt + ViewModel injection with @HiltViewModel',
            'Testing with @UninstallModules and test replacements',
          ],
          passCondition:
              'Set up a Hilt module providing a repository, inject it into a ViewModel, and explain @Provides vs @Binds — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_retrofit',
          name: 'Retrofit & Network Layer',
          subtopics: [
            'Retrofit setup with suspend functions and Moshi',
            'OkHttp interceptors for logging and auth headers',
            'Error handling with a sealed Result/Either class',
            'Offline-first strategy with Room as the single source of truth',
            'Certificate pinning and HTTPS configuration',
          ],
          passCondition:
              'Write a Retrofit service with a Result wrapper for errors, add an auth interceptor, and describe the offline-first strategy — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_datastore',
          name: 'DataStore & Preferences',
          subtopics: [
            'DataStore vs SharedPreferences — why DataStore wins',
            'Preferences DataStore: read and write typed keys',
            'Proto DataStore for typed schemas',
            'Coroutine-based API and Flow integration',
            'Migration from SharedPreferences',
          ],
          passCondition:
              'Write a DataStore-backed user preferences module, expose it as a Flow, and explain why SharedPreferences is unsafe on the main thread — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'android_p3',
      name: 'Architecture & Performance',
      weekRange: 'Weeks 6–8',
      priority: 'medium',
      topics: [
        Topic(
          id: 'android_architecture',
          name: 'Android Architecture — MVVM + Clean',
          subtopics: [
            'MVVM with Jetpack: ViewModel → Repository → DataSource',
            'Clean Architecture layers applied to Android',
            'UiState, UiEvent, and UiEffect pattern',
            'Navigation Component with Safe Args / Compose Navigation',
            'Unidirectional Data Flow (UDF) as the core principle',
          ],
          passCondition:
              'Draw the UDF diagram for a feature, explain why UI should never call a repository directly, and walk through adding a feature end-to-end — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_compose_perf',
          name: 'Compose Performance',
          subtopics: [
            'Composition, Layout, and Drawing phases',
            'Baseline profiles for startup performance',
            'LazyColumn performance: item keys and contentType',
            'Avoiding unstable lambdas and capturing mutable state',
            'Composition Trace in Android Studio',
          ],
          passCondition:
              'Read a Composition Trace and identify recomposition issues, write a stable key for LazyColumn, and explain baseline profiles — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_background',
          name: 'Background Work & WorkManager',
          subtopics: [
            'WorkManager for deferrable, guaranteed background work',
            'CoroutineWorker and Result handling',
            'Constraints: network type, battery, charging state',
            'Chaining workers sequentially and in parallel',
            'Doze mode and battery optimization impact on scheduling',
          ],
          passCondition:
              'Set up a periodic WorkManager job with a network constraint, chain two workers, and explain how Doze mode affects WorkManager — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'android_p4',
      name: 'Testing & Release',
      weekRange: 'Weeks 9–11',
      priority: 'good_to_have',
      topics: [
        Topic(
          id: 'android_testing',
          name: 'Testing — Unit, Integration, UI',
          subtopics: [
            'Unit tests: JUnit5, MockK for idiomatic Kotlin mocking',
            'ViewModel tests with TestCoroutineDispatcher / UnconfinedTestDispatcher',
            'Compose UI tests: createComposeRule, onNodeWithText',
            'Robolectric for JVM-side integration tests',
            'Espresso for full instrumented UI tests',
          ],
          passCondition:
              'Write a ViewModel test verifying UiState transitions, a Compose UI test, and explain Espresso vs Compose test rule trade-offs — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_modularization',
          name: 'App Modularization',
          subtopics: [
            'Feature modules vs library modules vs app module',
            'Build speed benefits and parallel compilation',
            'api vs implementation Gradle configurations',
            'Navigation between feature modules',
            'Now in Android as a reference modularized architecture',
          ],
          passCondition:
              'Explain the dependency graph of a 3-module app, describe what api vs implementation does to transitive dependencies, and sketch a feature split — without notes.',
          resources: [],
        ),
        Topic(
          id: 'android_cicd',
          name: 'CI/CD & Release Pipeline',
          subtopics: [
            'GitHub Actions workflow for Android build + test',
            'Gradle build variants and product flavors',
            'Fastlane supply for automated Play Store deployment',
            'Keystore management and signing configs',
            'App Bundle vs APK — size and delivery differences',
          ],
          passCondition:
              'Write a GitHub Actions YAML that builds a signed APK, explain AAB vs APK, and describe the internal testing → production release track workflow — without notes.',
          resources: [],
        ),
      ],
    ),
  ],
);