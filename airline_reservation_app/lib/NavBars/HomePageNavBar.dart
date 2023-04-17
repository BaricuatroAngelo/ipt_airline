import 'package:airline_reservation_app/homepage.dart';
import 'package:airline_reservation_app/loginpage.dart';
import 'package:airline_reservation_app/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors

class BlankPage extends StatefulWidget {
  const BlankPage({Key? key}) : super(key: key);

  @override
  State<BlankPage> createState() => _BlankPageState();
}

class _BlankPageState extends State<BlankPage> {
  int currentIndex = 0;

  static final List<Widget> screens = [
    HomePage(),
    SettingsPage(),
  ];

  void _navigateBottomBar(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: GNav(
        onTabChange: _navigateBottomBar,
        backgroundColor: Colors.blue,
        // rippleColor: Colors.blueAccent,
        tabBackgroundGradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ], stops: [
          0.5,
          1.1
        ]),
        tabs: [
          GButton(
            icon: Icons.home_sharp,
            text: ' Home',
            textColor: Colors.white,
            iconColor: Colors.white54,
            iconActiveColor: Colors.white54,
          ),
          // GButton(
          //   icon: Icons.thumb_up_alt,
          //   text: ' Favorites',
          //   textColor: Colors.white,
          //   iconColor: Colors.white54,
          //   iconActiveColor: Colors.white54,
          // ),
          GButton(
            icon: Icons.settings,
            text: ' Settings',
            textColor: Colors.white,
            iconColor: Colors.white54,
            iconActiveColor: Colors.white54,
          ),
        ],
      ));
  }
}
//       appBar: AppBar(
//         flexibleSpace: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//             colors: [
//               Colors.black,
//               Colors.black12,
//             ],
//             stops: [0.4, 1.0],
//           )),
//         ),
//         automaticallyImplyLeading: false,
//         // backgroundColor: Colors.black,
//         title: const Text(
//           'Tachiyomi',
//           style: TextStyle(
//               fontSize: 22,
//               fontWeight: FontWeight.bold,
//               fontFamily: 'Times New Roman'),
//         ),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//               icon: const Icon(Icons.search_outlined),
//               onPressed: () {
//                 showSearch(context: context, delegate: SearchBehavior());
//               }),
//         ],
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back_ios),
//             onPressed: () {
//               Navigator.pop(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginScreen()),
//               );
//             }),
//       ),
//     );
//   }
// }
//
// class SearchBehavior extends SearchDelegate {
//   List<String> searchResults = [
//     'Kimetsu no Yaiba',
//     'Attack on Titan',
//     'Blue Lock',
//     'Naruto',
//     'Bleach',
//   ];
//
//   @override
//   Widget? buildLeading(BuildContext context) => IconButton(
//       onPressed: () => close(context, null),
//       icon: const Icon(Icons.arrow_back_ios));
//
//   @override
//   List<Widget>? buildActions(BuildContext context) => [
//         IconButton(
//           icon: Icon(Icons.clear),
//           onPressed: () {
//             if (query.isEmpty) {
//               close(context, null);
//             } else {
//               query = '';
//             }
//           },
//         )
//       ];
//
//   @override
//   Widget buildResults(BuildContext context) => Center(
//         child: Text(
//           query,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 15,
//           ),
//         ),
//       );
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> suggestions = searchResults.where((searchResults) {
//       final result = searchResults.toLowerCase();
//       final input = query.toLowerCase();
//
//       return result.contains(input);
//     }).toList();
//
//     return ListView.builder(
//         itemCount: suggestions.length,
//         itemBuilder: (context, index) {
//           final suggestion = suggestions[index];
//
//           return ListTile(
//             title: Text(suggestion),
//             onTap: () {
//               query = suggestion;
//
//               showResults(context);
//             },
//           );
//         });
//   }
// }
