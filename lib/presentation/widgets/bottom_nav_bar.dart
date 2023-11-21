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
    return SizedBox(
      height: 98,
      child: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedLabelStyle: const TextStyle(
          color: Color(0xFF0054D3),
          fontSize: 11,
          fontFamily: 'Galano Grotesque',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.22,
        ),
        unselectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontFamily: 'Galano Grotesque',
          fontWeight: FontWeight.w600,
          height: 0,
          letterSpacing: 0.22,
        ),
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
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              showModalBottomSheet(
                context: context,
                builder: (context) => const SettingsPage(),
                isScrollControlled: true,
                useSafeArea: true,
                useRootNavigator: true,
              );
            }
          }
        },
      ),
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
