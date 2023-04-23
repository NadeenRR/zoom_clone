import 'package:flutter/material.dart';
import 'package:zoom_clone/utils/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank), label: 'Meet & chat'),
        BottomNavigationBarItem(
            backgroundColor: footerColor,
            icon: Icon(Icons.lock_clock),
            label: 'Meetings'),
        BottomNavigationBarItem(
            icon: Icon(Icons.percent_outlined), label: 'Contscts'),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined), label: 'Settings'),
        BottomNavigationBarItem(
            icon: Icon(Icons.comment_bank), label: 'Meet & chat'),
      ]),
    );
  }
}
