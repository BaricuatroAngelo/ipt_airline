import 'package:airline_reservation_app/main.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:intl/intl.dart';

import 'TripType.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController dateController = TextEditingController();
  TextEditingController arrivalController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
    arrivalController.text = "";
  }

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
                padding: const EdgeInsets.only(top: 200, right: 30, left: 30),
                child: Container(
                  height: 500,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, left: 10),
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
                            children: const [
                              TripType(title: 'Round Trip'),
                              TripType(title: 'One-Way'),
                              TripType(title: 'Multiway'),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'From\n',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                CountryListPick(
                                  onChanged: (CountryCode) {
                                    print(CountryCode?.name);
                                    print(CountryCode?.code);
                                    print(CountryCode?.dialCode);
                                    print(CountryCode?.flagUri);
                                  },
                                  theme: CountryTheme(
                                    isShowFlag: false,
                                    isShowTitle: true,
                                    isShowCode: false,
                                    showEnglishName: true,
                                  ),
                                  initialSelection: '+63',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Divider(
                            height: 30,
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'To\n',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                CountryListPick(
                                  onChanged: (CountryCode) {
                                    print(CountryCode?.name);
                                    print(CountryCode?.code);
                                    print(CountryCode?.dialCode);
                                    print(CountryCode?.flagUri);
                                  },
                                  theme: CountryTheme(
                                    isShowFlag: false,
                                    isShowTitle: true,
                                    isShowCode: false,
                                    showEnglishName: true,
                                  ),
                                  initialSelection: '+63',
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 30, right: 10, left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Depart',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Icon(Icons.calendar_today),
                              Text(
                                'Arrive',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Date',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  controller: dateController,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      String formattedDate =
                                      DateFormat("dd, MMM yyyy")
                                          .format(pickedDate);

                                      setState(() {
                                        dateController.text =
                                            formattedDate.toString();
                                      });
                                    } else {
                                      print('No Date Selected');
                                    }
                                  },
                                ),
                              )
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 10),
                                child: TextField(
                                  textAlign: TextAlign.end,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Date',
                                    hintStyle: TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                  ),
                                  controller: arrivalController,
                                  readOnly: true,
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2101));
                                    if (pickedDate != null) {
                                      String formattedDate =
                                      DateFormat("dd, MMM yyyy")
                                          .format(pickedDate);

                                      setState(() {
                                        arrivalController.text =
                                            formattedDate.toString();
                                      });
                                    } else {
                                      print('No Date Selected');
                                    }
                                  },
                                ),
                              )
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 35),
                        ),
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
