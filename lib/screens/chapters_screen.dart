import 'package:flutter/material.dart';
import 'lessons_screen.dart';

class ChaptersScreen extends StatelessWidget {
  final String subject;

  const ChaptersScreen({
    super.key,
    required this.subject,
  });

  @override
  Widget build(BuildContext context) {
    final chapters = [
      'Introduction to $subject',
      'Basic Concepts',
      'Core Principles',
      'Advanced Concepts',
      'Practice & Revision',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        title: Text(
          subject,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: chapters.length,
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
                child: Text('${i + 1}'),
              ),
              title: Text(
                chapters[i],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                i == 0 ? 'Completed' : '${i + 2} Lessons',
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),

              // ⭐ THIS OPENS LESSONS
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonsScreen(
                      subject: subject,
                      chapter: chapters[i],
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