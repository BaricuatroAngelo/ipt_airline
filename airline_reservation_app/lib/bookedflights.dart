import 'package:airline_reservation_app/loginpage.dart';
import 'package:flutter/material.dart';

class BookedFlights extends StatefulWidget {
  const BookedFlights({Key? key}) : super(key: key);

  @override
  State<BookedFlights> createState() => _BookedFlightsState();
}

class _BookedFlightsState extends State<BookedFlights> {
  bool _notificationsEnabled = true;
  String _currency = 'PHP';

  void _toggleNotifications(bool value) {
    setState(() {
      _notificationsEnabled = value;
    });
  }

  void _changeCurrency(String value) {
    setState(() {
      _currency = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Flights'),
        automaticallyImplyLeading: true,
      ),
      body: Container()
    );
  }
}
