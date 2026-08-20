import 'package:flutter/material.dart';
import 'notification_screen.dart';
import '../services/auth_service.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> register() async {
  if (name.text.trim().isEmpty ||
      email.text.trim().isEmpty ||
      password.text.isEmpty) {
    return;
  }

  final created = await AuthService.register(
    name.text,
    email.text,
    password.text,
  );

  if (!mounted) return;

  if (!created) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Account already exists. Please login.'),
      ),
    );
    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => NotificationScreen(
        name: name.text.trim(),
      ),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      appBar: AppBar(title: const Text('Create Account')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 25),
              const Text(
                'Start your learning journey 🚀',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Create your EdTech account.',
                style: TextStyle(color: Colors.grey[600]),
              ),
              const SizedBox(height: 30),

              _field(name, 'Full Name', Icons.person_outline),
              const SizedBox(height: 16),
              _field(email, 'Email', Icons.email_outlined),
              const SizedBox(height: 16),
              _field(
                password,
                'Password',
                Icons.lock_outline,
                obscure: true,
              ),

              const SizedBox(height: 28),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: register,
                  child: const Text(
                    'Create Account →',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool obscure = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}