import 'package:flutter/material.dart';
import 'quiz_screen.dart';
import '../services/progress_service.dart';

class LessonScreen extends StatefulWidget {
  final String subject;
  final String chapter;
  final String lesson;

  const LessonScreen({
    super.key,
    required this.subject,
    required this.chapter,
    required this.lesson,
  });

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // VIDEO PLACEHOLDER
            Container(
              height: 210,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF17142B),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Center(
                child: Icon(
                  Icons.play_circle_fill_rounded,
                  color: Colors.white,
                  size: 70,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              widget.lesson,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              '${widget.subject} • ${widget.chapter}',
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'About this lesson',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Learn the important concepts in this lesson through '
              'examples, explanations and practice activities.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Key Points 💡',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            _point('Understand the basic concepts'),
            _point('Learn through practical examples'),
            _point('Apply what you have learned'),

            const SizedBox(height: 25),

            // COMPLETE LESSON
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!completed) {
                    ProgressService.completeLesson();

                    setState(() {
                      completed = true;
                    });
                  }
                },
                icon: Icon(
                  completed
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                ),
                label: Text(
                  completed
                      ? 'Lesson Completed ✓'
                      : 'Mark as Complete',
                ),
              ),
            ),

            const SizedBox(height: 12),

            // QUIZ BUTTON
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const QuizScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Take Quiz →',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _point(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: Color(0xFF6C4BEF),
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}