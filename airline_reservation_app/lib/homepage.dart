import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'flightdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _tripTypeController = TextEditingController();
  final _countryFromController = TextEditingController();
  final _countryToController = TextEditingController();
  final _departDateController = TextEditingController();
  final _returnDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _tripTypeController,
                decoration: InputDecoration(
                  labelText: 'Trip Type',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a trip type';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryFromController,
                decoration: InputDecoration(
                  labelText: 'Country From',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a country from';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryToController,
                decoration: InputDecoration(
                  labelText: 'Country To',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a country to';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _departDateController,
                decoration: InputDecoration(
                  labelText: 'Departure Date',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a departure date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _returnDateController,
                decoration: InputDecoration(
                  labelText: 'Return Date',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a return date';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Flight newFlight = Flight(
                    tripType: _tripTypeController.text,
                    countryFrom: _countryFromController.text,
                    countryTo: _countryToController.text,
                    departDate: _departDateController.text,
                    returnDate: _returnDateController.text,
                  );
                  Map<String, String> headers = {
                    'Content-type': 'application/json',
                    'Accept': 'application/json',
                  };

                  String url = 'http://10.0.2.2:8000/api/booked';

                  http.post(Uri.parse(url),
                      headers: headers, body: jsonEncode(newFlight.toJson())).then((response) {
                    print(response.body);
                  });
                },
                child: Text('Add Trip'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
