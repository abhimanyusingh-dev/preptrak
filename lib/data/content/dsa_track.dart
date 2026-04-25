import 'package:preptrak/domain/entities/track.dart';

const dsaTrack = Track(
  id: 'dsa',
  name: 'DSA',
  description: 'Data structures & algorithms — shared across all tracks',
  phases: [
    Phase(
      id: 'dsa_p1',
      name: 'Foundations',
      weekRange: 'Weeks 1–2',
      priority: 'highest',
      topics: [
        Topic(
          id: 'dsa_arrays_hashing',
          name: 'Arrays & Hashing',
          subtopics: [
            'Two Sum, Contains Duplicate, Valid Anagram patterns',
            'HashMap frequency counting',
            'Prefix sums for range queries',
            'In-place array manipulation techniques',
          ],
          passCondition:
              'Solve any medium HashMap or prefix sum problem without hints, explain time/space complexity — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_two_pointers',
          name: 'Two Pointers & Sliding Window',
          subtopics: [
            'Opposite-end pointers: Valid Palindrome, Two Sum II',
            'Fast/slow pointers: cycle detection in linked lists',
            'Fixed-size sliding window: max sum of subarray',
            'Variable-size window: Longest Substring Without Repeating Characters',
          ],
          passCondition:
              'Identify which pattern applies to a new problem, solve a medium sliding window problem — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_stack_queue',
          name: 'Stack & Queue',
          subtopics: [
            'Stack for matching/nesting: Valid Parentheses, Min Stack',
            'Monotonic stack: Next Greater Element, Daily Temperatures',
            'Queue with BFS traversal',
            'Deque for sliding window maximum',
          ],
          passCondition:
              'Solve a monotonic stack problem and explain the invariant being maintained — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_binary_search',
          name: 'Binary Search',
          subtopics: [
            'Classic binary search on sorted array',
            'Binary search on answer: Koko Eating Bananas, Minimum in Rotated Array',
            'Left/right boundary search templates',
            '2D matrix binary search',
          ],
          passCondition:
              'Write binary search from scratch, apply it to a "search on answer" problem, and explain when to use lo vs lo+1 as the boundary — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_linked_list',
          name: 'Linked Lists',
          subtopics: [
            'Reverse a linked list (iterative and recursive)',
            'Floyd\'s cycle detection algorithm',
            'Merge two sorted lists',
            'Find middle node with fast/slow pointers',
            'LRU Cache with doubly linked list + HashMap',
          ],
          passCondition:
              'Implement LRU Cache from scratch in O(1) get/put, and solve any medium linked list problem — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'dsa_p2',
      name: 'Trees & Graphs',
      weekRange: 'Weeks 3–5',
      priority: 'high',
      topics: [
        Topic(
          id: 'dsa_binary_trees',
          name: 'Binary Trees — DFS & BFS',
          subtopics: [
            'Recursive DFS: preorder, inorder, postorder',
            'Iterative DFS with a stack',
            'BFS with a queue: level-order traversal',
            'Height, diameter, and lowest common ancestor',
            'Path sum problems',
          ],
          passCondition:
              'Solve 3 medium tree DFS problems and 1 BFS problem without hints, explaining the recursive call stack — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_bst',
          name: 'Binary Search Trees',
          subtopics: [
            'BST invariant and search/insert/delete operations',
            'Validate BST with range constraints',
            'Kth smallest/largest element in BST',
            'BST to sorted array (inorder traversal)',
          ],
          passCondition:
              'Implement BST insert and search, solve validate BST, and explain why inorder traversal gives sorted output — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_heap',
          name: 'Heap & Priority Queue',
          subtopics: [
            'Min-heap and max-heap properties and operations',
            'Top K elements pattern with a heap',
            'K Closest Points, Kth Largest Element',
            'Merge K sorted lists',
            'Two heaps pattern for median finding',
          ],
          passCondition:
              'Solve Find Median from Data Stream using two heaps, and explain when a heap beats sorting — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_graphs',
          name: 'Graphs — BFS & DFS',
          subtopics: [
            'Graph representations: adjacency list vs matrix',
            'BFS for shortest path in unweighted graph',
            'DFS for connected components and cycle detection',
            'Islands pattern: Number of Islands, Pacific Atlantic',
            'Topological sort (DFS + Kahn\'s algorithm)',
          ],
          passCondition:
              'Solve Number of Islands and Course Schedule, explain the topological sort algorithm — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_advanced_graphs',
          name: 'Advanced Graphs',
          subtopics: [
            'Dijkstra\'s algorithm for shortest path in weighted graph',
            'Bellman-Ford for graphs with negative edges',
            'Union-Find (Disjoint Set Union) with path compression',
            'Minimum spanning tree: Kruskal and Prim',
            'Strongly connected components (Tarjan/Kosaraju)',
          ],
          passCondition:
              'Implement Dijkstra\'s with a min-heap and Union-Find with path compression, explain when to use each — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'dsa_p3',
      name: 'Dynamic Programming',
      weekRange: 'Weeks 6–8',
      priority: 'medium',
      topics: [
        Topic(
          id: 'dsa_dp_1d',
          name: '1D Dynamic Programming',
          subtopics: [
            'DP fundamentals: overlapping subproblems, optimal substructure',
            'Top-down (memoization) vs bottom-up (tabulation)',
            'Classic 1D: Fibonacci, Climbing Stairs, House Robber',
            'Longest Increasing Subsequence (LIS)',
            'Coin Change and unbounded knapsack',
          ],
          passCondition:
              'Solve House Robber and Coin Change from scratch, convert a top-down solution to bottom-up, and state the recurrence relation — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_dp_2d',
          name: '2D Dynamic Programming',
          subtopics: [
            '0/1 Knapsack and its 2D DP table',
            'Longest Common Subsequence (LCS)',
            'Edit Distance (Levenshtein)',
            'Unique Paths and grid DP',
            'Burst Balloons (interval DP)',
          ],
          passCondition:
              'Solve LCS and Edit Distance, draw the 2D DP table for each, and explain the state transition — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_tries',
          name: 'Tries',
          subtopics: [
            'Trie data structure: insert, search, startsWith',
            'Word Search II with Trie + DFS backtracking',
            'Longest word with all prefixes',
            'Replace words with root in sentence',
          ],
          passCondition:
              'Implement a Trie from scratch and solve Word Search II, explaining the backtracking pruning — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_intervals_greedy',
          name: 'Intervals & Greedy',
          subtopics: [
            'Sort-then-sweep: Merge Intervals, Non-overlapping Intervals',
            'Meeting Rooms I and II',
            'Greedy: Jump Game, Gas Station',
            'Activity selection and scheduling problems',
          ],
          passCondition:
              'Solve Meeting Rooms II and Merge Intervals, explain the greedy proof for each — without notes.',
          resources: [],
        ),
      ],
    ),
    Phase(
      id: 'dsa_p4',
      name: 'Backtracking & Mocks',
      weekRange: 'Weeks 9–10',
      priority: 'good_to_have',
      topics: [
        Topic(
          id: 'dsa_backtracking',
          name: 'Backtracking',
          subtopics: [
            'Backtracking template: choose → explore → unchoose',
            'Subsets, Permutations, Combinations',
            'N-Queens and Sudoku Solver',
            'Word Search on a grid',
            'Pruning strategies to avoid TLE',
          ],
          passCondition:
              'Implement Subsets and Permutations using backtracking, solve N-Queens, and explain the call tree — without notes.',
          resources: [],
        ),
        Topic(
          id: 'dsa_mock_interviews',
          name: 'Mock Interviews',
          subtopics: [
            'Simulate real interview timing: 45 min per problem',
            'Talk-through-before-code habit',
            'Complexity analysis for every solution',
            'Pattern identification under pressure',
            'System design lite: when asked about data structures at scale',
          ],
          passCondition:
              'Complete 5 timed mock sessions (Pramp or peer mock), solving medium problems with full explanation and complexity analysis — without notes.',
          resources: [
            Resource(
              title: 'Pramp — Free Mock Interviews',
              url: 'https://www.pramp.com',
            ),
          ],
        ),
      ],
    ),
  ],
);