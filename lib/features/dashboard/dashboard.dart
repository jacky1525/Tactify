import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Dashboard extends StatelessWidget {
  final Widget child;
  const Dashboard({super.key, required this.child});

  static const _routes = ['/champions', '/spells', '/home', '/runes', '/items'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _routes.indexOf(location);

    return Scaffold(
      body: child,
      bottomNavigationBar: bottomNavMenu(
        currentIndex,
        context: context,
      ), 
    );
  }

  CurvedNavigationBar bottomNavMenu(
    int currentIndex, {
    required BuildContext context,
  }) {
    return CurvedNavigationBar(
      index: currentIndex >= 0 ? currentIndex : 2,
      height: 75,
      backgroundColor: Colors.transparent,
      color: const Color(0xFF1E1E2E),
      buttonBackgroundColor: const Color(0xFF2A2A40),
      animationDuration: const Duration(milliseconds: 300),
      items: [
        Image.asset(
          'assets/icons/icons8-spartan-helmet-48.png',
          width: 25,
          height: 25,
          color: Colors.white,
        ),
        Image.asset(
          'assets/icons/SummonerFlash.png',
          width: 25,
          height: 25,
          color: Colors.white,
        ),
        Image.asset(
          'assets/icons/search_profile.png',
          width: 25,
          height: 25,
          color: Colors.white,
        ),
        Image.asset(
          'assets/icons/7200_Domination.png',
          width: 25,
          height: 25,
          color: Colors.white,
        ),
        Image.asset(
          'assets/icons/icons8-body-armor-48.png',
          width: 25,
          height: 25,
          color: Colors.white,
        ),
      ],
      onTap: (index) => context.go(_routes[index]),
    );
  }
}
