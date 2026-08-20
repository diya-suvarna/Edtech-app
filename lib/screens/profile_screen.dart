import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;

  const ProfileScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // PROFILE HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6C4BEF),
                    Color(0xFF9B6DFF),
                  ],
                ),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.person_rounded,
                      size: 55,
                      color: Color(0xFF6C4BEF),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'EdTech Learner',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      '⭐ Level 5 Learner',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 18),

            // DAILY STREAK
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE4D6),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        '🔥',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '7 Day Streak',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Keep learning every day!',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '🔥',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // LEARNING GOAL
            _sectionTitle('Learning Goal 🎯'),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFE9DEFF),
                    child: Icon(
                      Icons.flag_rounded,
                      color: Color(0xFF6C4BEF),
                    ),
                  ),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Complete 2 lessons daily',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Stay consistent and reach your goals.',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // SUBJECTS
            _sectionTitle('My Subjects 📚'),

            const SizedBox(height: 12),

            Row(
              children: [
                _subject('🧮', 'Maths'),
                const SizedBox(width: 10),
                _subject('🔬', 'Science'),
                const SizedBox(width: 10),
                _subject('📖', 'English'),
              ],
            ),

            const SizedBox(height: 24),

            // ACHIEVEMENTS
            _sectionTitle('Achievements 🏆'),

            const SizedBox(height: 12),

            Row(
              children: [
                _achievement('🔥', '7 Day\nStreak'),
                const SizedBox(width: 10),
                _achievement('🎯', 'Quiz\nMaster'),
                const SizedBox(width: 10),
                _achievement('📚', 'Bookworm'),
              ],
            ),

            const SizedBox(height: 24),

            // LEARNING SUMMARY
            _sectionTitle('Learning Summary'),

            const SizedBox(height: 12),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF17142B),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Text(
                'You have built a 7-day learning streak and '
                'are consistently exploring new lessons. '
                'Keep your streak alive and continue learning! 🚀',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.5,
                  fontSize: 15,
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _subject(
    String emoji,
    String title,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 7),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _achievement(
    String emoji,
    String title,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 27),
            ),
            const SizedBox(height: 7),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}