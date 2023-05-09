import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'con.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  final List = ['PROVIDER', 'USER'];

  var type = TextEditingController();
  var name = TextEditingController();
  var lname = TextEditingController();
  var address = TextEditingController();
  var city = TextEditingController();
  var state = TextEditingController();
  var pin = TextEditingController();
  var phonenumber = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  final dropdownState = GlobalKey<FormFieldState>();
  Future<void> getData() async {
    var data = {
      "type": dropdownState.currentState!.value,
      "first_name": name.text,
      "Last_name": lname.text,
      "street_address": address.text,
      "city": city.text,
      "state": state.text,
      "pin": pin.text,
      "Phone number": phonenumber.text,
      "Email": email.text,
      "Password": password.text,
    };
    if (formkey.currentState!.validate()) {
      print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>$data');
      var response = await post(Uri.parse('${Con.url}register.php'), body: data);
      print(response.body);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body)["message"];
        if (res == 'added') {
          const snackBar = SnackBar(
            content: Text("successfully registered"),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Homelog();
          }));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("REGISTRATION FORM"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Form(
              key: formkey,
              child: Column(children: [
                DropdownButtonFormField(
                    key: dropdownState,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    hint: Text('Select type'),
                    items: List.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (value) {}),

                // Padding(
                //   padding: const EdgeInsets.only(left:10.0,right: 10.0,top:10.0),
                //   child: Container(
                //     width: 100,
                //     child: TextField(
                //       controller: name,
                //       decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30.0),
                //
                //         ),
                //         labelText:"type",hintText: "type ",
                //       ),
                //       keyboardType: TextInputType.name,
                //     ),
                //   ),
                // ),

                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Container(
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "First Name",
                        hintText: "First Name",
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name is required';
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
                      controller: lname,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Last Name",
                        hintText: "Last Name",
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last name is required';
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
                // Padding(
                //   padding: const EdgeInsets.only(left:80.0,right: 20.0,top:10.0),
                //   child: Container(
                //     width: 100,
                //     child: TextField(
                //       decoration: InputDecoration(
                //         border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(30.0),
                //
                //         ),
                //         labelText:"street address2",hintText: "street address2",
                //       ),
                //       keyboardType: TextInputType.name,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Container(
                    child: TextFormField(
                      controller: city,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "City",
                        hintText: "City",
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'City is required';
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
                      controller: state,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "State",
                        hintText: "State",
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'State is required';
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
                      controller: pin,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Pin",
                        hintText: "Pin",
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Pin is required';
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
                      controller: phonenumber,
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
                      controller: email,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Email",
                        hintText: "Email",
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!value.contains('@')) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: Container(
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                      ),
                      obscureText: true,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                  child: Container(
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        getData();
                      },
                      child: Text("Submit"),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
