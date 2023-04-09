import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:i2c2_hackathon/AccountDetail.dart';
import 'package:i2c2_hackathon/CourseDetail.dart';
import 'package:i2c2_hackathon/searchscreen.dart';

import 'homeScreen.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;
  List<Widget> _widgetoptions = [
    HomeScreen(),
    SearchPage(),
    CourseDetail(),
    AccountDetails()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: GNav(
            onTabChange: (value) {
              print(value);
              setState(() {
                currentIndex = value;
              });
            },
            selectedIndex: currentIndex,
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            haptic: true, // haptic feedback
            tabBorderRadius: 20,
            // tabActiveBorder: Border.all(
            //     color: Color.fromARGB(255, 178, 59, 199),
            //     width: 1), // tab button border
            // tabBorder: Border.all(
            //     color: Color.fromARGB(255, 255, 255, 255),
            //     width: 1), // tab button border
            // tabShadow: [
            //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
            // ],
            iconSize: 25,
            padding: EdgeInsets.all(8),
            gap: 8,
            tabs: [
              GButton(
                iconColor: Colors.grey[700],
                backgroundColor: Color.fromARGB(255, 232, 201, 238),
                iconActiveColor: Color.fromARGB(255, 178, 59, 199),
                icon: Icons.home_outlined,
                text: 'Home',
                textColor: Color.fromARGB(255, 178, 59, 199),
              ),
              GButton(
                iconColor: Colors.grey[700],
                backgroundColor: Color.fromARGB(255, 243, 224, 199),
                iconActiveColor: Color.fromARGB(255, 219, 152, 65),
                icon: Icons.settings_outlined,
                text: 'Likes',
                textColor: Color.fromARGB(255, 219, 152, 65),
              ),
              GButton(
                iconColor: Colors.grey[700],
                backgroundColor: Color.fromARGB(255, 194, 246, 234),
                iconActiveColor: Color.fromARGB(255, 48, 202, 166),
                icon: Icons.search_outlined,
                text: 'Search',
                textColor: Color.fromARGB(255, 68, 215, 181),
              ),
              GButton(
                iconColor: Colors.grey[700],
                backgroundColor: Color.fromARGB(255, 238, 181, 191),
                iconActiveColor: Color.fromARGB(255, 213, 68, 92),
                icon: Icons.person_outlined,
                text: 'Profile',
                textColor: Color.fromARGB(255, 213, 68, 92),
              )
            ],
          ),
        ),
      ),
      body: IndexedStack(
        children: _widgetoptions,
        index: currentIndex,
      ),
    );
  }
}
