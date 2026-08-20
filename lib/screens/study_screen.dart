import 'package:flutter/material.dart';

class StudyScreen extends StatelessWidget {
  const StudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Study',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Explore Courses 📚',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _course('🧮', 'Mathematics', '12 Chapters'),
          _course('🔬', 'Science', '15 Chapters'),
          _course('💻', 'Coding', '10 Chapters'),
          _course('📖', 'English', '8 Chapters'),
        ],
      ),
    );
  }

  Widget _course(String emoji, String title, String chapters) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Text(
          emoji,
          style: const TextStyle(fontSize: 30),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(chapters),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}