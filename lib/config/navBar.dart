import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intellihealth/config/app_config.dart';
import 'package:intellihealth/ui/home/home.dart';
class NavBar extends StatefulWidget {
  final int currentIndex;

  const NavBar({super.key, required this.currentIndex});

  @override
  State<NavBar> createState() => _NavBarPageState();
}

class _NavBarPageState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: AppConfig.primaryColor,
      animationDuration: const Duration(milliseconds: 300),
      items: const [
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.group, color: Colors.white),
        Icon(Icons.account_circle, color: Colors.white),
        Icon(Icons.calendar_month, color: Colors.white),
        Icon(Icons.video_library, color: Colors.white),
      ],
      index: widget.currentIndex, // Utiliza el valor proporcionado en el constructor
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Home(),
              ),
            );
            break;
        }
      },
    );
  }
}