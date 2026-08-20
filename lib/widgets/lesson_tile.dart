import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const LessonTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE9DEFF),
          child: Icon(
            icon,
            color: const Color(0xFF6C4BEF),
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        ),
      ),
    );
  }
}