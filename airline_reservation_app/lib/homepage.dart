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
  String _selectedTripType = '';

  void _onTripTypeSelected(String tripType) {
    setState(() {
      _selectedTripType = tripType;
    });
  }

  TextEditingController dateController = TextEditingController();
  TextEditingController returnController = TextEditingController();

  @override
  void initState() {
    super.initState();
    dateController.text = "";
    returnController.text = "";
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
                    padding: EdgeInsets.only(left: 20, top: 80),
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
                child: SizedBox(
                  height: 500,
                  child: Container(
                    padding: const EdgeInsets.only(top: 15, left: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              TripType(
                                title: 'Round Trip',
                                selectedValue: _selectedTripType,
                                onSelected: _onTripTypeSelected,
                              ),
                              TripType(
                                title: 'One-Way',
                                selectedValue: _selectedTripType,
                                onSelected: _onTripTypeSelected,
                              ),
                              TripType(
                                title: 'Multiway',
                                selectedValue: _selectedTripType,
                                onSelected: _onTripTypeSelected,
                              ),
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
                                'Return',
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
                            )),
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
                                controller: returnController,
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
                                      returnController.text =
                                          formattedDate.toString();
                                    });
                                  } else {
                                    print('No Date Selected');
                                  }
                                },
                              ),
                            )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 30),
                          child: Container(
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.blue),
                              child: Center(
                                child: InkWell(
                                  onTap: () {},
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )),
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
