# Interview Prep Tracker — Product Plan

**App Name:** PrepTrack  
**Platform:** Flutter (iOS + Android)  
**Version:** 1.0 MVP  
**Author:** Abhimanyu Singh  
**Last Updated:** April 2026

---

## 1. Problem Statement

Most developers preparing for technical interviews know *what* to study but struggle with:

- No structured order to study topics — everything feels equally important
- No clear definition of "done" for a topic — reading feels like progress but isn't
- No single place that combines roadmap + progress tracking + accountability
- Generic resources that aren't tailored to their specific role or tech stack

Existing tools (LeetCode, NeetCode, Roadmap.sh) solve parts of this but none give a
**role-specific, phase-based roadmap with measurable pass criteria per topic.**

---

## 2. Solution

A Flutter application that:

1. Lets the user select their **target role track** (Flutter Engineer / Android Engineer)
2. Generates a **phase-based study timeline** with topics ordered by interview priority
3. Defines a clear **pass condition per topic** — not "read about X" but "can do Y without notes"
4. Tracks progress locally with **visual indicators** per phase and topic
5. Sends **daily study reminders** to maintain consistency

---

## 3. Target User

- Mobile engineers (Flutter / Android) with 1–4 years of experience
- Actively preparing for a job switch
- Need structure, not more content
- Self-motivated but prone to context-switching mid-session

---

## 4. Track Scope (MVP)

MVP launches with two tracks only. More tracks added post-launch based on feedback.

| Track | Phases | Topics |
|---|---|---|
| Flutter Engineer | 4 phases | 15 topics |
| Android Engineer (Kotlin) | 4 phases | 14 topics |

DSA roadmap is **shared across both tracks** — same phases, same problems, same pass criteria.

---

## 5. Core Features (MVP)

### 5.1 Track Selection
- Onboarding screen on first launch
- User selects one track: Flutter or Android
- Track stored locally — can be changed later in settings
- No account or login required

### 5.2 Roadmap Screen
- Displays all 4 phases for selected track
- Each phase shows: phase name, week range, topic count, completion %
- Phases are collapsible
- Locked visual on phases the user hasn't reached yet (soft lock — can still open)

### 5.3 Topic Detail
- Topic name + subtopics (bullet points of what to study)
- Pass condition — clearly stated, action-oriented
- Resources list (curated links: YouTube, docs, articles)
- Mark as done button — only enabled when user taps "I can pass this"
- Notes field — user can jot their own notes per topic

### 5.4 Progress Tracking
- Per-topic: not started / in progress / done
- Per-phase: progress bar (done topics / total topics)
- Overall dashboard: total % complete, current phase, streak
- All progress stored locally using Hive (no backend in MVP)

### 5.5 DSA Tracker
- Separate tab for DSA — shared across both tracks
- Topics by phase (Foundations → Trees → DP → Mocks)
- Problem count tracker per topic (user manually inputs count)
- Pass condition per topic same as roadmap

### 5.6 Daily Reminder
- Local notification at a user-set time
- Simple message: "Your study session is waiting. 45 mins today keeps the offer close."
- Configurable in settings — on/off + time picker

### 5.7 Settings
- Change track
- Reset progress (with confirmation)
- Toggle notifications + set time
- About screen (app version, GitHub link)

---

## 6. Out of Scope for MVP

The following are intentionally excluded to keep MVP lean and shippable:

- User authentication / cloud sync
- Multiple track selection simultaneously
- AI-generated roadmaps
- Social features (leaderboard, sharing progress)
- Backend / Firestore integration
- Swift / Python / JavaScript tracks
- Interview scheduling or calendar integration
- In-app content editor (content is hardcoded in MVP)

---

## 7. Tech Stack

| Layer | Choice | Reason |
|---|---|---|
| Framework | Flutter 3.x | Core skill — demonstrates proficiency |
| State Management | Riverpod | Modern, scalable, interview-relevant |
| Local Storage | Hive | Fast, lightweight, no setup overhead |
| Architecture | Clean Architecture | Domain / Data / Presentation layers |
| Navigation | GoRouter | Deep link ready, declarative |
| Notifications | flutter_local_notifications | Simple, no backend needed |
| DI | Riverpod providers | No separate DI library needed |
| Testing | flutter_test + Mockito | Unit + widget tests for core logic |

---

## 8. Architecture

```
lib/
├── core/
│   ├── constants/
│   ├── theme/
│   └── utils/
├── data/
│   ├── models/          # Track, Phase, Topic, Progress
│   ├── repositories/    # ProgressRepository (Hive)
│   └── sources/         # local_data_source.dart
├── domain/
│   ├── entities/
│   └── usecases/        # GetRoadmap, UpdateTopicStatus, GetProgress
├── presentation/
│   ├── onboarding/
│   ├── dashboard/
│   ├── roadmap/
│   ├── topic_detail/
│   ├── dsa/
│   └── settings/
└── main.dart
```

Clean Architecture with 3 layers: **Data → Domain → Presentation**  
No layer talks to a layer it shouldn't know about.

---

## 9. Data Model

```dart
// Track
class Track {
  final String id;          // 'flutter' | 'android'
  final String name;
  final List<Phase> phases;
}

// Phase
class Phase {
  final String id;
  final String name;
  final String weekRange;   // e.g. 'Weeks 1–3'
  final String priority;    // 'highest' | 'high' | 'medium' | 'good_to_have'
  final List<Topic> topics;
}

// Topic
class Topic {
  final String id;
  final String name;
  final List<String> subtopics;
  final String passCondition;
  final List<Resource> resources;
}

// Progress (stored in Hive)
class TopicProgress {
  final String topicId;
  TopicStatus status;       // notStarted | inProgress | done
  String? userNotes;
  DateTime? completedAt;
}
```

---

## 10. Screen Flow

```
App Launch
    │
    ▼
First launch? ──Yes──▶ Onboarding (Track Selection) ──▶ Dashboard
    │
    No
    │
    ▼
Dashboard
    ├──▶ Roadmap Tab
    │       ├──▶ Phase List (collapsible)
    │       └──▶ Topic Detail ──▶ Mark Done
    ├──▶ DSA Tab
    │       ├──▶ DSA Phase List
    │       └──▶ DSA Topic Detail
    └──▶ Settings Tab
            ├──▶ Change Track
            ├──▶ Notification Settings
            └──▶ Reset Progress
```

---

## 11. Content Plan

Content is hardcoded as Dart data classes in MVP (no CMS or backend).

### Flutter Track — 4 Phases, 15 Topics

**Phase 1 — Core Internals (Weeks 1–3, Highest Priority)**
1. Widget tree & rendering pipeline
2. StatelessWidget vs StatefulWidget lifecycle
3. State management (Riverpod + BLoC)
4. Keys in Flutter
5. BuildContext & InheritedWidget

**Phase 2 — Dart & Async (Weeks 4–5, High Priority)**
6. Event loop & async/await
7. Streams & StreamController
8. Isolates & compute()
9. Null safety & type system

**Phase 3 — Performance & Architecture (Weeks 6–8, Medium)**
10. Performance optimization & DevTools
11. Clean Architecture in Flutter
12. Navigation & GoRouter + deep linking

**Phase 4 — Testing & Platform (Weeks 9–11, Good to Have)**
13. Unit & widget testing
14. Platform channels & FFI
15. CI/CD & release (GitHub Actions + flavors)

### Android Track — 4 Phases, 14 Topics
*(Similar structure — Compose, ViewModel, Coroutines, Flow, Room, Hilt, etc.)*

### DSA Track — Shared, 4 Phases, 16 Topics
*(Arrays → Trees → DP → Mocks — as defined in study plan)*

---

## 12. Development Phases

### Phase 0 — Setup (Week 1, ~3 days)
- [ ] Flutter project setup with Clean Architecture folder structure
- [ ] Riverpod + Hive + GoRouter configured
- [ ] Theme system (light + dark mode)
- [ ] Lint rules + analysis_options.yaml
- [ ] GitHub repo + README skeleton

### Phase 1 — Core Shell (Week 1–2, ~5 days)
- [ ] Onboarding screen — track selection UI
- [ ] Bottom navigation (Roadmap / DSA / Settings tabs)
- [ ] Dashboard screen with overall progress stats
- [ ] Track + progress stored in Hive

### Phase 2 — Roadmap Feature (Week 2–3, ~6 days)
- [ ] Phase list screen with collapsible phases
- [ ] Progress bar per phase
- [ ] Topic detail screen (name, subtopics, pass condition, resources)
- [ ] Mark topic as done / in progress
- [ ] Notes field per topic

### Phase 3 — DSA Feature (Week 3–4, ~4 days)
- [ ] DSA tab with phase breakdown
- [ ] Problem count tracker (manual input)
- [ ] Pass condition per DSA topic
- [ ] DSA progress linked to overall dashboard

### Phase 4 — Polish + Notifications (Week 4, ~4 days)
- [ ] Local notifications setup
- [ ] Notification settings screen (toggle + time picker)
- [ ] Settings screen (change track, reset progress)
- [ ] Loading states, empty states, error states
- [ ] Light + dark mode QA

### Phase 5 — Testing + Release (Week 5, ~5 days)
- [ ] Unit tests for all use cases
- [ ] Widget tests for critical screens
- [ ] GitHub Actions CI pipeline
- [ ] README with screenshots + architecture diagram
- [ ] Play Store internal testing release

---

## 13. Success Metrics (Personal MVP)

Since this is a portfolio project, success is measured by:

| Metric | Target |
|---|---|
| Ships and runs without crashes | 100% |
| Used personally during job search | Daily |
| GitHub stars | Not a priority — quality over vanity |
| Interviewers ask about it | Goal: mentioned in 80% of interviews |
| Architecture is explainable in 5 mins | Must-have |
| Test coverage on domain layer | >70% |

---

## 14. Risks & Mitigations

| Risk | Mitigation |
|---|---|
| Scope creep — adding features mid-build | Freeze feature list after Phase 0. New ideas go in a backlog doc |
| Content going stale | Version content as data classes — easy to update without structural changes |
| App never ships (perfectionism) | Set a hard ship date: 5 weeks from start. Ship rough, polish after |
| Too similar to existing apps | Keep pass conditions as the core differentiator — no other app does this |

---

## 15. Future Roadmap (Post-MVP)

These are deliberately out of scope for v1 but worth planning for:

- **v1.1** — Firebase sync (progress across devices), user auth
- **v1.2** — Community-contributed roadmaps, content rating
- **v1.3** — AI-generated pass conditions based on job description input
- **v2.0** — Additional tracks: Backend (Node/Go), iOS (Swift), Web (React)
- **v2.x** — Interview scheduler + calendar integration, mock interview mode

---

## 16. Timeline Summary

| Week | Milestone |
|---|---|
| Week 1 | Setup + onboarding + navigation shell |
| Week 2 | Roadmap feature complete |
| Week 3 | DSA feature complete |
| Week 4 | Notifications + settings + polish |
| Week 5 | Tests + CI + Play Store internal release |

**Target ship date: 5 weeks from project start**

---

*This document is a living plan. Update it as decisions change — but freeze the MVP feature list after Week 1 setup.*
