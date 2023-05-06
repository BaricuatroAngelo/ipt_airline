import 'package:airline_reservation_app/homepage.dart';
import 'package:airline_reservation_app/loginpage.dart';
import 'package:airline_reservation_app/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  int currentIndex = 0;

  static final List<Widget> screens = [
    HomePage(),
    SettingsPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: _navigateBottomBar,
        backgroundColor: Colors.transparent,
        rippleColor: Colors.transparent,
        tabBackgroundGradient: LinearGradient(colors: [
          Colors.transparent,
          Colors.transparent,
        ], stops: [
          0.5,
          1.1
        ]),
        tabs: [
          GButton(
            icon: Icons.home_sharp,
            text: ' Home',
            textColor: Colors.grey,
            iconColor: Colors.grey,
            iconActiveColor: Colors.grey,
          ),
          // GButton(
          //   icon: Icons.thumb_up_alt,
          //   text: ' Favorites',
          //   textColor: Colors.white,
          //   iconColor: Colors.white54,
          //   iconActiveColor: Colors.white54,
          // ),
          GButton(
            icon: Icons.settings,
            text: ' Settings',
            textColor: Colors.grey,
            iconColor: Colors.grey,
            iconActiveColor: Colors.grey,
          ),
        ],
      ));
  }
}
