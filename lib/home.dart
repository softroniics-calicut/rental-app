import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';




class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  void initState(){
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Homelog())));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('lib/assets/img/WhatsApp Image 2023-04-10 at 08.14.47.jpg'),
      ),
    );
  }
}