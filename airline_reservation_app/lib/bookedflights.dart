import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'flightdetails.dart';

class BookedFlightsPage extends StatefulWidget {
  const BookedFlightsPage({Key? key}) : super(key: key);

  @override
  _BookedFlightsPageState createState() => _BookedFlightsPageState();
}

class _BookedFlightsPageState extends State<BookedFlightsPage> {
  String _generateGateNumber() {
    final letters = ['A', 'B', 'C', 'D'];
    final random = Random();
    final letter = letters[random.nextInt(letters.length)];
    final number = random.nextInt(5) + 1;
    return '$letter$number';
  }
  late Future<List<Flight>> _bookedFlights;

  @override
  void initState() {
    super.initState();
    _bookedFlights = _fetchBookedFlights();
  }

  Future<List<Flight>> _fetchBookedFlights() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/booked'));
    if (response.statusCode == 200) {
      final jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList.map((json) => Flight.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch booked flights');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booked Flights'),
      ),
      body: Center(
        child: FutureBuilder<List<Flight>>(
          future: _bookedFlights,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final flights = snapshot.data!;
              return ListView.builder(
                itemCount: flights.length,
                itemBuilder: (context, index) {
                  final flight = flights[index];
                  return Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${flight.countryFrom} to ${flight.countryTo}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Departure: ${flight.departDate} | Return: ${flight.returnDate}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Gate Number: ${_generateGateNumber()}'
                        )
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
