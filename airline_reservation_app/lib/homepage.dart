// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'flightdetails.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
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
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Stack(
            children: [
              Positioned(
                top: 10,
                child: Container(
                  height: 300,
                  width: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: Colors.blue),
                  child: Padding(
                    padding: EdgeInsets.only(top: 65, left: 15),
                    child: Text('Book Your\nFlights Now!', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 50,
                    ),),
                  )
                ),
              ),
              Positioned(
                  top: 225,
                  right: 20,
                  child: Container(
                    height: 425,
                    width: 350,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: _tripTypeController.text.isNotEmpty
                                ? _tripTypeController.text
                                : null,
                            decoration: InputDecoration(
                              labelText: 'Trip Type',
                            ),
                            items: <String>['One Way', 'Round Trip']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _tripTypeController.text = value!;
                              });
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a trip type';
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
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a departure date';
                              }
                              return null;
                            },
                            onTap: () async {
                              // Get the current value of the text field
                              String currentValue = _departDateController.text;

                              // Show the date picker dialog box
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: currentValue.isNotEmpty
                                    ? DateTime.parse(currentValue)
                                    : DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );

                              // If a date was selected, update the text field with the new value
                              if (selectedDate != null) {
                                setState(() {
                                  _departDateController.text = selectedDate
                                      .toIso8601String()
                                      .substring(0, 10);
                                });
                              }
                            },
                          ),
                          TextFormField(
                            controller: _returnDateController,
                            decoration: InputDecoration(
                              labelText: 'Return Date',
                            ),
                            readOnly: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a return date';
                              }
                              return null;
                            },
                            onTap: () async {
                              // Get the current value of the text field
                              String currentValue = _returnDateController.text;

                              // Show the date picker dialog box
                              DateTime? selectedDate = await showDatePicker(
                                context: context,
                                initialDate: currentValue.isNotEmpty
                                    ? DateTime.parse(currentValue)
                                    : DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );

                              // If a date was selected, update the text field with the new value
                              if (selectedDate != null) {
                                setState(() {
                                  _returnDateController.text = selectedDate
                                      .toIso8601String()
                                      .substring(0, 10);
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Check if any text form field controller is empty
                              if (_tripTypeController.text.isEmpty ||
                                  _countryFromController.text.isEmpty ||
                                  _countryToController.text.isEmpty ||
                                  _departDateController.text.isEmpty ||
                                  _returnDateController.text.isEmpty) {
                                // Display an error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Please fill in all fields')),
                                );
                              } else {
                                Flight newFlight = Flight(
                                  tripType: _tripTypeController.text,
                                  countryFrom: _countryFromController.text,
                                  countryTo: _countryToController.text,
                                  departDate: _departDateController.text,
                                  returnDate: _returnDateController.text,
                                );
                                // Set the headers for the POST request
                                Map<String, String> headers = {
                                  'Content-type': 'application/json',
                                  'Accept': 'application/json',
                                };
                                // Set the URL for the POST request
                                String url = 'http://10.0.2.2:8000/api/booked';
                                // Send the POST request with the new Flight data
                                http
                                    .post(Uri.parse(url),
                                        headers: headers,
                                        body: jsonEncode(newFlight.toJson()))
                                    .then((response) {
                                  // Print the response body
                                  print(response.body);
                                  _countryFromController.clear();
                                  _countryToController.clear();
                                  _departDateController.clear();
                                  _returnDateController.clear();
                                });
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 16.0),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Add Trip',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }
}
