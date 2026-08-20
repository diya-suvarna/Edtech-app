import 'package:flutter/material.dart';

import 'subjects_screen.dart';
import 'lesson_screen.dart';
import 'quiz_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  final String name;

  const HomePage({
    super.key,
    this.name = 'Diya',
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  static const purple = Color(0xFF6C4BEF);
  static const background = Color(0xFFF7F5FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(),
              const SizedBox(height: 24),
              _welcomeCard(),
              const SizedBox(height: 26),
              _sectionTitle('Continue Learning'),
              const SizedBox(height: 12),
              _continueLearning(),
              const SizedBox(height: 26),
              _sectionTitle('Your Subjects'),
              const SizedBox(height: 12),
              _subjects(),
              const SizedBox(height: 26),
              _sectionTitle('Recent Lessons'),
              const SizedBox(height: 12),
              _recentLessons(),
              const SizedBox(height: 26),
              _sectionTitle('Quick Actions'),
              const SizedBox(height: 12),
              _quickActions(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: _navigate,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book_outlined),
            selectedIcon: Icon(Icons.menu_book),
            label: 'Subjects',
          ),
          NavigationDestination(
            icon: Icon(Icons.bar_chart_outlined),
            selectedIcon: Icon(Icons.bar_chart),
            label: 'Progress',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ---------------- NAVIGATION ----------------

  void _navigate(int index) {
    if (index == 0) {
      setState(() => selectedIndex = 0);
      return;
    }

    if (index == 1) {
      _open(const SubjectsScreen());
      return;
    }

    if (index == 2) {
      _open(const ProgressScreen());
      return;
    }

    if (index == 3) {
      _open(ProfileScreen(name: widget.name));
    }
  }

  void _open(Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  void _openLesson({
    String subject = 'Physics',
    String chapter = 'Motion & Force',
    String lesson = 'Introduction',
  }) {
    _open(
      LessonScreen(
        subject: subject,
        chapter: chapter,
        lesson: lesson,
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _header() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hey, ${widget.name} 👋',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                'Ready to learn something new?',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: _showNotifications,
          icon: const Icon(
            Icons.notifications_none_rounded,
          ),
        ),
      ],
    );
  }

  void _showNotifications() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('No new notifications'),
      ),
    );
  }

  // ---------------- WELCOME ----------------

  Widget _welcomeCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF17142B),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Keep learning,\nkeep growing 🚀',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              height: 1.2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Explore subjects and continue your learning journey.',
            style: TextStyle(
              color: Colors.white70,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 18),
          ElevatedButton(
            onPressed: () => _open(const SubjectsScreen()),
            child: const Text('Start Learning →'),
          ),
        ],
      ),
    );
  }

  // ---------------- CONTINUE LEARNING ----------------

  Widget _continueLearning() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _openLesson(),
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Row(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color(0xFFE9DEFF),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Icon(
                  Icons.play_circle_fill_rounded,
                  color: purple,
                  size: 38,
                ),
              ),
              const SizedBox(width: 15),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Motion & Force',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Physics • Introduction',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 9),
                    LinearProgressIndicator(
                      value: .45,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ---------------- SUBJECTS ----------------

  Widget _subjects() {
    return Row(
      children: [
        _subjectCard(
          '🧮',
          'Mathematics',
          () => _open(const SubjectsScreen()),
        ),
        const SizedBox(width: 10),
        _subjectCard(
          '🔬',
          'Science',
          () => _open(const SubjectsScreen()),
        ),
        const SizedBox(width: 10),
        _subjectCard(
          '📖',
          'English',
          () => _open(const SubjectsScreen()),
        ),
      ],
    );
  }

  Widget _subjectCard(
    String emoji,
    String title,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 6,
          ),
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
              const SizedBox(height: 8),
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
      ),
    );
  }

  // ---------------- RECENT LESSONS ----------------

  Widget _recentLessons() {
    return Column(
      children: [
        _lessonTile(
          'Introduction to Motion',
          'Physics',
        ),
        _lessonTile(
          'Fractions & Decimals',
          'Mathematics',
        ),
        _lessonTile(
          'Grammar Basics',
          'English',
        ),
      ],
    );
  }

  Widget _lessonTile(
    String title,
    String subject,
  ) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 4,
        ),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE9DEFF),
          child: Icon(
            Icons.menu_book_rounded,
            color: purple,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(subject),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 15,
        ),
        onTap: () => _openLesson(
          subject: subject,
          chapter: 'Basics',
          lesson: title,
        ),
      ),
    );
  }

  // ---------------- QUICK ACTIONS ----------------

  Widget _quickActions() {
    return Row(
      children: [
        _quickAction(
          Icons.quiz_rounded,
          'Take Quiz',
          () => _open(const QuizScreen()),
        ),
        const SizedBox(width: 10),
        _quickAction(
          Icons.psychology_rounded,
          'Ask AI',
          _showAiMessage,
        ),
        const SizedBox(width: 10),
        _quickAction(
          Icons.explore_rounded,
          'Explore',
          () => _open(const SubjectsScreen()),
        ),
      ],
    );
  }

  void _showAiMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'AI learning assistant coming soon!',
        ),
      ),
    );
  }

  Widget _quickAction(
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: purple,
                size: 27,
              ),
              const SizedBox(height: 8),
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
      ),
    );
  }

  // ---------------- SECTION TITLE ----------------

  Widget _sectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}