import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int current = 0;
  int score = 0;
  int? selected;

  final questions = const [
    {
      'q': 'What is the SI unit of force?',
      'a': ['Joule', 'Newton', 'Watt', 'Pascal'],
      'correct': 1,
    },
    {
      'q': 'Which quantity is measured in metres?',
      'a': ['Mass', 'Time', 'Distance', 'Force'],
      'correct': 2,
    },
    {
      'q': 'What is the acceleration due to gravity?',
      'a': ['9.8 m/s²', '5 m/s²', '20 m/s²', '1 m/s²'],
      'correct': 0,
    },
    {
      'q': 'Which is a vector quantity?',
      'a': ['Mass', 'Speed', 'Distance', 'Velocity'],
      'correct': 3,
    },
    {
      'q': 'What does speed measure?',
      'a': [
        'Distance per unit time',
        'Force per unit time',
        'Mass per unit time',
        'Energy per unit time',
      ],
      'correct': 0,
    },
  ];

  void nextQuestion() {
    if (selected == null) return;

    if (selected == questions[current]['correct']) {
      score++;
    }

    if (current == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => QuizResultScreen(
            score: score,
            total: questions.length,
          ),
        ),
      );
      return;
    }

    setState(() {
      current++;
      selected = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[current];
    final answers = question['a'] as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${current + 1}/${questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(
              value: (current + 1) / questions.length,
            ),
            const SizedBox(height: 30),

            Text(
              question['q'] as String,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ...List.generate(
              answers.length,
              (i) => GestureDetector(
                onTap: () {
                  setState(() {
                    selected = i;
                  });
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: selected == i
                        ? const Color(0xFFE9DEFF)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: selected == i
                          ? const Color(0xFF6C4BEF)
                          : Colors.black12,
                    ),
                  ),
                  child: Text(
                    answers[i],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton(
                onPressed: selected == null ? null : nextQuestion,
                child: Text(
                  current == questions.length - 1
                      ? 'Finish Quiz'
                      : 'Next Question',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuizResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const QuizResultScreen({
    super.key,
    required this.score,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = ((score / total) * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '🎉',
                style: TextStyle(fontSize: 65),
              ),
              const SizedBox(height: 15),
              const Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '$score / $total',
                style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6C4BEF),
                ),
              ),
              Text(
                '$percentage% Score',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Text(
                percentage >= 80
                    ? 'Excellent work! 🌟'
                    : percentage >= 60
                        ? 'Good job! Keep learning. 👍'
                        : 'Keep practising. You can do it! 💪',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Back to Lesson'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}