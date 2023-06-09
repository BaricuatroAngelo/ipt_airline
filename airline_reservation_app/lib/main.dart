import 'package:airline_reservation_app/NavBars/HomePageNavBar.dart';
import 'package:airline_reservation_app/homepage.dart';
import 'package:airline_reservation_app/loginpage.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}