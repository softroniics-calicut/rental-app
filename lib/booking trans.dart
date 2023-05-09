import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:vehicleportaladmin/transportation.dart';

import 'con.dart';

class Bok extends StatefulWidget {
  const Bok({
    Key? key,
  }) : super(key: key);

  @override
  State<Bok> createState() => _BokState();
}

final List1 = ['Bus', 'Auto', 'Taxi'];

class _BokState extends State<Bok> {
  var name = TextEditingController();
  var phone_no = TextEditingController();
  var address = TextEditingController();
  var from = TextEditingController();
  var destination = TextEditingController();
  var date = TextEditingController();
  var time = TextEditingController();
  var vehicle = TextEditingController();
  var payment = TextEditingController();
  Future<void> getData() async {
    var data = {
      "name": name.text,
      "phone_no": phone_no.text,
      "address": address.text,
      "from": from.text,
      "destination": destination.text,
      "date": date.text,
      "time": time.text,
      "vehicle": vehicle.text,
      "payment": payment.text,
    };
    print(data);
    var response = await post(Uri.parse('${Con.url}booktran.php'), body: data);
    print(response.body);
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body)["message"];
      if (res == 'added') {
        const snackBar = SnackBar(
          content: Text("successfully"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        // Fluttertoast.showToast(msg: 'Successfully added...');
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Vehicles();
        }));
      } else {
        Fluttertoast.showToast(msg: 'Invalid ');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOKING DETAILS"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Name",
                    hintText: "Name ",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: phone_no,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Phone no",
                    hintText: "Phone no ",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Address",
                    hintText: "Address ",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: from,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "From",
                    hintText: "From",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: destination,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "destination",
                    hintText: "destination",
                  ),
                  keyboardType: TextInputType.name,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: date,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Date",
                    hintText: "Date",
                  ),
                  keyboardType: TextInputType.datetime,
                  onTap: () async {
                    DateTime? datepick = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2025),
                    );
                    if (datepick != null) {
                      print('Date selected: ${datepick.year}-${datepick.month}-${datepick.day}');
                    }
                  },
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                width: 100,
                child: TextField(
                  controller: time,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Time",
                    hintText: "Time",
                    suffixIcon: IconButton(
                      onPressed: () async {
                        TimeOfDay? timepick = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          initialEntryMode: TimePickerEntryMode.input,
                        );
                        if (timepick != null) {
                          print("Time selected: ${timepick.hour}:${timepick.minute}");
                        }
                      },
                      icon: Icon(Icons.timer),
                    ),
                  ),
                  keyboardType: TextInputType.datetime,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  hint: Text('Select Vehicle'),
                  items: List1.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {}),
            ),

            // Padding(
            //   padding: const EdgeInsets.only(left:80.0,right: 20.0,top:10.0),
            //   child: Container(
            //     width: 100,
            //     child: TextField(
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(30.0),
            //         ),
            //         labelText:"Password",hintText: "Password",
            //       ),
            //       obscureText: true,
            //     ),            //   ),
            // ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      getData();
                    },
                    child: Text("payment"))),
          ],
        ),
      ),
    );
  }
}
