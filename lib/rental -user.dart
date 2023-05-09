import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bike.dart';
import 'car.dart';

class Vehicle extends StatefulWidget {
  const Vehicle({Key? key}) : super(key: key);

  @override
  _VehicleState createState() => _VehicleState();
}

class _VehicleState extends State<Vehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Vehicle"),
        // backgroundColor: Color(0xFF84EE9),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 80.0),
          child: Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => car()),
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  child: Image.asset("lib/assets/img/mastang.jpeg"),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => bike()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("lib/assets/img/unicorn.jpeg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
