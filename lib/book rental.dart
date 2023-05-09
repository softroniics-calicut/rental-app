import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicleportaladmin/Paymentui.dart';
import 'package:vehicleportaladmin/services.dart';
import 'package:http/http.dart' as http;

import 'con.dart';

class Bokrent extends StatefulWidget {
  final String id;
  Bokrent(this.id, {Key? key}) : super(key: key);

  @override
  State<Bokrent> createState() => _BokrentState();
}

class _BokrentState extends State<Bokrent> {
  File? upload_photofile;
  final List = ['Aadhar', 'Voter ID', 'Driving licence', 'Passport'];
  final List1 = [
    'Car',
    'Bike',
  ];
  var name = TextEditingController();
  var phone_no = TextEditingController();
  var address = TextEditingController();
  var from = TextEditingController();
  var destination = TextEditingController();
  var date = TextEditingController();
  var vehicle = TextEditingController();
  var payment = TextEditingController();
  var end = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  void startPayment() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => Paymentui(),
      ),
    );
  }

  Future<void> addphototwo() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('regi_id');

    var request = http.MultipartRequest("POST", Uri.parse("${Con.url}bookrental.php"));
    request.fields["name"] = name.text;
    request.fields["phone_no"] = phone_no.text;
    request.fields["address"] = address.text;
    request.fields["destination"] = destination.text;
    request.fields["date"] = date.text;
    request.fields["last_date"] = end.text;
    request.fields["select_proof"] = dropdownState.currentState!.value;
    request.fields["payment"] = payment.text;
    request.fields["id"] = widget.id;
    var poto = await http.MultipartFile.fromPath("pic", upload_photofile!.path);
    request.files.add(poto);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    // var data = json.decode(responseString);
    if (responseString.isNotEmpty) {
      Fluttertoast.showToast(msg: 'successfully added');
      startPayment();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOKING RENTAL DETAILS"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: " Name",
                    hintText: " Name",
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  controller: phone_no,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Phone number",
                    hintText: "Phone number",
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Phone number is required";
                    }
                    if (value.length != 10) {
                      return "Please enter a valid 10-digit phone number";
                    }
                    return null;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: Container(
                child: TextFormField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "Address",
                    hintText: "Address",
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Address is required';
                    }
                    return null;
                  },
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
                    labelText: "Starts Date",
                    hintText: "Starts date",
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
                      date.text = "${datepick.year}-${datepick.month}-${datepick.day}";
                      print('Date starts: ${datepick.year}-${datepick.month}-${datepick.day}');
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
                  controller: end,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    labelText: "End Date",
                    hintText: "End Date",
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
                      end.text = "${datepick.year}-${datepick.month}-${datepick.day}";

                      print('End date: ${datepick.year}-${datepick.month}-${datepick.day}');
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
              child: DropdownButtonFormField(
                  key: dropdownState,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )),
                  hint: Text('Select Proof'),
                  items: List.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {}),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload file',
                    style: TextStyle(fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      File? temp = await Services.pickImage(context);
                      setState(() {
                        upload_photofile = temp;
                      });
                      // print(pickedImage!.path);
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                  // image == null ? Text('no image') : Image.file(image!),
                ],
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0), child: ElevatedButton(onPressed: addphototwo, child: Text("Submit"))),
          ],
        ),
      ),
    );
  }
}
