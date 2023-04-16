import 'package:airline_reservation_app/main.dart';
import 'package:flutter/material.dart';

import 'TripType.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Container(
                  height: 244,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50.0),
                        bottomRight: Radius.circular(50.0)),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20, top: 45),
                    child: Text(
                      'Book Your\nNext Flight',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        wordSpacing: 5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 200,right: 30,left: 30),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: 500,
                  child: Container(
                    padding: EdgeInsets.only(top: 15, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              TripType(title: 'Round Trip'),
                              TripType(title: 'One-Way'),
                            ],
                          ),
                        ),
                        Container(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
