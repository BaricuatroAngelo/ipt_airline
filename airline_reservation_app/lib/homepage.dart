import 'package:airline_reservation_app/main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text(
            'Book Your\nNext Flight',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}
