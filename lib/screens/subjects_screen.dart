import 'package:flutter/material.dart';
import 'chapters_screen.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final subjects = [
      ('🧮', 'Mathematics', '12 Chapters'),
      ('🔬', 'Science', '15 Chapters'),
      ('📖', 'English', '10 Chapters'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Subjects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: subjects.length,
        itemBuilder: (_, i) {
          final subject = subjects[i];

          return Card(
            margin: const EdgeInsets.only(bottom: 14),
            elevation: 0,
            child: ListTile(
              contentPadding: const EdgeInsets.all(14),
              leading: Text(
                subject.$1,
                style: const TextStyle(fontSize: 32),
              ),
              title: Text(
                subject.$2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(subject.$3),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (_) => ChaptersScreen(
                        subject: subject.$2,
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