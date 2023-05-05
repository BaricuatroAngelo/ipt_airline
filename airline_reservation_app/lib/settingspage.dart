import 'package:airline_reservation_app/loginpage.dart';
import 'package:flutter/material.dart';

import 'bookedflights.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
        title: const Text('Settings'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              title: const Text('Enable notifications'),
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
            ),
            const SizedBox(height: 16),
            const Text(
              'Currency',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ListTile(
              title: const Text('PHP'),
              trailing: _currency == 'PHP' ? const Icon(Icons.check) : null,
              onTap: () => _changeCurrency('PHP'),
            ),
            ListTile(
              title: const Text('EUR'),
              trailing: _currency == 'EUR' ? const Icon(Icons.check) : null,
              onTap: () => _changeCurrency('EUR'),
            ),
            ListTile(
              title: const Text('GBP'),
              trailing: _currency == 'GBP' ? const Icon(Icons.check) : null,
              onTap: () => _changeCurrency('GBP'),
            ),
            const Text(
              'Flights',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Booked Flights'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const BookedFlights()));
              },
            ),
            const Text(
              'Others',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const LoginPage()));
              },
            )
          ],
        ),
      ),
    );
  }
}
