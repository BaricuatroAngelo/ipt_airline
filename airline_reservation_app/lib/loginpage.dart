// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:airline_reservation_app/NavBars/HomePageNavBar.dart';
import 'package:airline_reservation_app/registrationpage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _errorMessage;

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final endpoint = Uri.parse('http://10.0.2.2:8000/api/users');
    final response = await http.get(endpoint);

    if (response.statusCode == 200) {
      final users = jsonDecode(response.body);
      final matchingUser = users.firstWhere(
            (user) => user['username'] == username && user['password'] == password,
        orElse: () => null,
      );

      if (matchingUser != null) {
        // TODO: login successful, navigate to next screen
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const BlankPage()));
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Airline Reservation System",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w900,
              color: Colors.blue,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          if (_errorMessage != null)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
            child: TextFormField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your username';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 1),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient:
                const LinearGradient(colors: [Colors.blue, Colors.green]),
              ),
              child: Center(
                child: InkWell(
                  onTap: _login,
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account? ",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RegistrationPage(),
                  ));
                },
                child: const Text(
                  "Register Account",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

