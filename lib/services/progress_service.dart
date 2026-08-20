import 'package:flutter/foundation.dart';

class ProgressService {
  static final ValueNotifier<int> completedLessons =
      ValueNotifier<int>(4);

  static final ValueNotifier<int> quizScore =
      ValueNotifier<int>(80);

  static void completeLesson() {
    if (completedLessons.value < 12) {
      completedLessons.value++;
    }
  }

  static int get progressPercentage {
    return ((completedLessons.value / 12) * 100).round();
  }
}