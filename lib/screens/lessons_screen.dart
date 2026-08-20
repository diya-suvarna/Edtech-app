import 'package:flutter/material.dart';
import 'lesson_screen.dart';

class LessonsScreen extends StatelessWidget {
  final String subject;
  final String chapter;

  const LessonsScreen({
    super.key,
    required this.subject,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    final lessons = [
      'Introduction',
      'Key Concepts',
      'Worked Examples',
      'Practice',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        title: Text(
          chapter,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: lessons.length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: CircleAvatar(
                backgroundColor: const Color(0xFFE9DEFF),
                child: Icon(
                  i == 0
                      ? Icons.play_arrow_rounded
                      : Icons.menu_book_rounded,
                  color: const Color(0xFF6C4BEF),
                ),
              ),
              title: Text(
                lessons[i],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '$subject • Lesson ${i + 1}',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonScreen(
                      subject: subject,
                      chapter: chapter,
                      lesson: lessons[i],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}