import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicleportaladmin/utils/file_upload.dart';

import 'add rental.dart';
import 'con.dart';
import 'main menu-user.dart';
import 'main menu.dart';
import 'package:vehicleportaladmin/services.dart';
import 'package:http/http.dart' as http;

class Addtrans extends StatefulWidget {
  const Addtrans({Key? key}) : super(key: key);

  @override
  State<Addtrans> createState() => _AddtransState();
}

class _AddtransState extends State<Addtrans> {
  var vehicle = TextEditingController();
  var location = TextEditingController();
  var seat = TextEditingController();
  var price = TextEditingController();
  var RC = TextEditingController();

  var insurance = TextEditingController();
  var driving_licence = TextEditingController();
  var upload_photo = TextEditingController();
  File? upload_photofile;
  File? upload_rc;
  File? upload_ins;
  File? upload_dl;
  Future<void> addphototwo() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    var sp = spref.getString('regi_id');

    var request = http.MultipartRequest("POST", Uri.parse("${Con.url}add_transportation.php"));

    request.fields["vehicle"] = vehicle.text;
    request.fields["seat"] = seat.text;
    request.fields["location"] = location.text;
    request.fields["price"] = price.text;
    var rc = await http.MultipartFile.fromPath("rc", upload_rc!.path);
    request.files.add(rc);
    var ins = await http.MultipartFile.fromPath("insurance", upload_ins!.path);
    request.files.add(ins);
    var dl = await http.MultipartFile.fromPath("licence", upload_dl!.path);
    request.files.add(dl);
    var poto = await http.MultipartFile.fromPath("pic", upload_photofile!.path);
    request.files.add(poto);
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var responseString = String.fromCharCodes(responseData);
    print(responseString);
    // var data = json.decode(responseString);
    if (responseString.isNotEmpty) {
      Fluttertoast.showToast(msg: 'successfully added');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Mainmenu1(),
        ),
      );
    }
  }

  Future<void> getData() async {
    var data = {
      "vehicle": vehicle.text,
      "number_of_seats": seat.text,
      "location": location.text,
      "RC": RC.text,
      "price": price.text,
      "insurance": insurance.text,
      "dl": driving_licence.text,
      "upload_photo": upload_photo.text,
    };
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
    // var response = await post(Uri.parse('${Con.url}add_transportation.php'), body: data);
    // print(response.body);
    // if (response.statusCode == 200) {
    //   var res = jsonDecode(response.body)["message"];
    //   if (res == 'added') {
    //     const snackBar = SnackBar(content: Text("successfully"),
    //     );
    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
    //     // Fluttertoast.showToast(msg: 'Successfully added...');
    //     Navigator.push(context, MaterialPageRoute(builder: (context) {
    //       return Mainmenu1();
    //     }
    //     ));
    //   }
    //   else {
    //     Fluttertoast.showToast(msg: 'Invalid ');
    //   }
    // }
    // addTranspotation(imageFile, rc, insurance, driving, photo, url, params)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transportation Vehicles"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: TextField(
                  controller: vehicle,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Type of vehicle", hintText: "enter your vehicle type"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: TextField(
                  controller: seat,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "seat", hintText: "enter number of seats"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: TextField(
                  controller: price,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "price", hintText: "price"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: TextField(
                  controller: location,
                  decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Location", hintText: "enter your Location"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload RC',
                    style: TextStyle(fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      File? temp = await Services.pickImage(context);
                      setState(() {
                        upload_rc = temp;
                      });
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                  // image == null ? Text('no image') : Image.file(image!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload Insurance',
                    style: TextStyle(fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      File? temp = await Services.pickImage(context);
                      setState(() {
                        upload_ins = temp;
                      });
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                  // image == null ? Text('no image') : Image.file(image!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload driving licence',
                    style: TextStyle(fontSize: 15),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      File? temp = await Services.pickImage(context);
                      setState(() {
                        upload_dl = temp;
                      });
                    },
                    child: Icon(Icons.camera_alt),
                  ),
                  // image == null ? Text('no image') : Image.file(image!),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upload photo',
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
            ElevatedButton(
                onPressed: () {
                  addphototwo();
                  //getData();
                },
                child: Text("ADD"))
          ],
        ),
      ),
    );
  }
}
