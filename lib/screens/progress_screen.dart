import 'package:flutter/material.dart';
import '../services/progress_service.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        title: const Text(
          'My Progress',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: ProgressService.completedLessons,
        builder: (context, completed, _) {
          final progress = completed / 12;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _overallProgress(progress),
                const SizedBox(height: 28),

                const Text(
                  'Learning Summary',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),

                Row(
                  children: [
                    _statCard(
                      '$completed',
                      'Lessons',
                      Icons.menu_book_rounded,
                    ),
                    const SizedBox(width: 12),
                    _statCard(
                      '4',
                      'Completed',
                      Icons.check_circle_rounded,
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    _statCard(
                      '80%',
                      'Quiz Average',
                      Icons.quiz_rounded,
                    ),
                    const SizedBox(width: 12),
                    _statCard(
                      '3',
                      'Subjects',
                      Icons.school_rounded,
                    ),
                  ],
                ),

                const SizedBox(height: 28),

                const Text(
                  'Subject Progress',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),

                _progressItem('Mathematics', .75),
                _progressItem('Science', .60),
                _progressItem('English', .45),

                const SizedBox(height: 28),

                const Text(
                  'Recent Performance 🏆',
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 14),

                Card(
                  elevation: 0,
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFFE9DEFF),
                      child: Icon(
                        Icons.emoji_events_rounded,
                        color: Color(0xFF6C4BEF),
                      ),
                    ),
                    title: const Text(
                      'Physics Quiz',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text('Completed recently'),
                    trailing: const Text(
                      '80%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _overallProgress(double progress) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF17142B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          const Text(
            'Overall Learning Progress',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 110,
            height: 110,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 10,
                  backgroundColor: Colors.white24,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    Color(0xFFFF6B35),
                  ),
                ),
                Text(
                  '${(progress * 100).round()}%',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Text(
            'Keep going! You are making great progress.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: const Color(0xFF6C4BEF),
              size: 28,
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _progressItem(
    String subject,
    double progress,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                subject,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('${(progress * 100).round()}%'),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(value: progress),
        ],
      ),
    );
  }
}