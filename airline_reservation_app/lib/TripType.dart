import 'package:flutter/material.dart';

class TripType extends StatelessWidget{
  const TripType({super.key, required this.title});
  final String title;

  @override
  Widget build (BuildContext context){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Chip(
        label: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}