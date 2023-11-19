import 'package:flutter/material.dart';
import 'package:scoob/presentation/pages/home_page.dart';
import 'package:scoob/presentation/pages/settings_page.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            switchTransition(() => const HomePage()),
          );
        } else if (index == 1) {
          Navigator.push(
            context,
            switchTransition(() => const SettingsPage()),
          );
        }
      },
    );
  }

  PageRouteBuilder<dynamic> switchTransition(Widget Function() page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page(),
      transitionDuration: const Duration(milliseconds: 100),
      transitionsBuilder: (_, animation, __, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
