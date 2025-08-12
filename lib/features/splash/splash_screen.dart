import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String title = "Tactify";

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      context.go('/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(title.length, (index) {
            final char = title[index];
            return Text(
                  char,
                  style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                )
                .animate(delay: Duration(milliseconds: 150 * index))
                .fadeIn(duration: 400.ms)
                .scale(
                  begin: const Offset(0.9, 0.9),
                  end: const Offset(1.0, 1.0),
                  duration: 400.ms,
                  curve: Curves.easeOut,
                );
          }),
        ),
      ),
    );
  }
}
