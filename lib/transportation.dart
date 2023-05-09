import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vehicleportaladmin/taxi.dart';
import 'package:vehicleportaladmin/truck.dart';


import 'auto.dart';
import 'bus.dart';


class Vehicles extends StatefulWidget {
  const Vehicles({Key? key}) : super(key: key);

  @override
  State<Vehicles> createState() => _VehiclesState();
}

class _VehiclesState extends State<Vehicles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select  transportation vehicle"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bus()),
                  );
                },
                child: Container(
                  height: 80,
                  width: 80,
                  child: Image.asset("lib/assets/img/busss.jpg"),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Auto()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("lib/assets/img/teja-handy-passenger-auto-500x500.jpg"),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Taxi()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("lib/assets/img/3.jpeg"),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Truck()),
                    );
                  },
                  child: Container(
                    height: 80,
                    width: 80,
                    child: Image.asset("lib/assets/img/4.jpeg"),
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



