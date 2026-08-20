import 'package:flutter/material.dart';
import 'home_screen.dart';

class NotificationScreen extends StatelessWidget {
  final String name;

  const NotificationScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('🔔', style: TextStyle(fontSize: 75)),
              const SizedBox(height: 25),
              const Text(
                'Stay in the loop',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Get reminders for lessons, quizzes, '
                'streaks and updates.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HomePage(name: name),
                      ),
                    );
                  },
                  child: const Text('Turn on notifications'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(name: name),
                    ),
                  );
                },
                child: const Text('Maybe later'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}