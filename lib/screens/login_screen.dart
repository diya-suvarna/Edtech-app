import 'package:flutter/material.dart';
import 'register_screen.dart';
import 'notification_screen.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool hidePassword = true;

  Future<void> login() async {
  if (email.text.trim().isEmpty || password.text.isEmpty) {
    return;
  }

  final name = await AuthService.login(
    email.text,
    password.text,
  );

  if (!mounted) return;

  if (name == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Invalid email or password.'),
      ),
    );
    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => NotificationScreen(name: name),
    ),
  );
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),

              Center(
                child: Image.asset(
                  'assets/kindling_logo.png',
                  width: 110,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Welcome back 👋',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Login to continue your learning journey.',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 30),

              TextField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email_outlined),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: password,
                obscureText: hidePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() => hidePassword = !hidePassword);
                    },
                    icon: Icon(
                      hidePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: login,
                  child: const Text(
                    'Login →',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: const Text("Don't have an account? Create Account"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}