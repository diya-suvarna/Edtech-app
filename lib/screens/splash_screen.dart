import 'package:flutter/material.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation<double> textOpacity;
  late final Animation<double> logoScale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2700),
    );

    // Text fades first.
    textOpacity = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.45,
          0.655,
          curve: Curves.easeOut,
        ),
      ),
    );

    // Logo stays still while text fades,
    // then smoothly grows all the way out.
    logoScale = Tween<double>(
      begin: 1.0,
      end: 12.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(
          0.655,
          1.0,
          curve: Curves.easeInOutCubic,
        ),
      ),
    );

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const LoginScreen(),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5FF),
      body: Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, _) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.scale(
                  scale: logoScale.value,
                  child: Image.asset(
                    'assets/kindling_logo.png',
                    width: 120,
                    height: 120,
                    fit: BoxFit.contain,
                  ),
                ),

                Opacity(
                  opacity: textOpacity.value,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 155),
                    child: Text(
                      'EdTech',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        color: Color(0xFF17142B),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}