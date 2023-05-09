import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicleportaladmin/payment.dart';

import 'MY PROFILE.dart';
import 'main menu-user.dart';
import 'main menu.dart';


class nav extends StatefulWidget {
  const nav({Key? key}) : super(key: key);

  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav> {
  int currentindex=0;
  final pages=[
    Mainmenu(),
    // Mainmenu(),
    // Devprofile(),
    Viewpro(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Fixed
        // backgroundColor: Colors.black, // <-- This works for fixed
        selectedItemColor: Colors.teal,
        // unselectedItemColor: Colors.grey,
        currentIndex: currentindex,
        onTap: (newIndex){
          setState(() {
            currentindex=newIndex;
          });

        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label:"Home",
            backgroundColor: Colors.black,),

          BottomNavigationBarItem(icon: Icon(
            Icons.person,
          ),
              label:"profile"),
        ],
      ),

    );
  }
}