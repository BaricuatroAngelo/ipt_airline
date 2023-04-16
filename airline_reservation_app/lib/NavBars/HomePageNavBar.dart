import 'package:airline_reservation_app/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ToDoListScreen extends StatefulWidget {
  const ToDoListScreen({Key? key}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  int currentIndex = 0;

  static final List<Widget> screens = [
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: _onItemTapped,
        backgroundColor: Colors.pink,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'To-Do List',
            textColor: Colors.white,
            iconColor: Colors.white,
            iconActiveColor: Colors.white54,
          ),
          GButton(
            icon: Icons.check,
            text: 'Completed Tasks',
            textColor: Colors.white,
            iconColor: Colors.white,
            iconActiveColor: Colors.white54,
          ),
        ],
      ),
    );
  }
}