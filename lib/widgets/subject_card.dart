import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final String emoji;
  final String title;
  final Color background;

  const SubjectCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.background,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Text(emoji, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}