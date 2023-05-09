import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'book rental.dart';
import 'con.dart';

class view extends StatefulWidget {
  view({Key? key, required this.id}) : super(key: key);
  String id;

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  Future<dynamic> getData() async {
    var data = {
      "id": widget.id,
    };
    print('object');
    var response = await post(Uri.parse('${Con.url}viewren.php'), body: data);
    print(response.body);
    var res = jsonDecode(response.body);
    print(res);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data[0]['message'] == 'Failed') {
                    return Center(child: Text('Not Available'));
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  child: Image.asset('lib/assets/img/seltos-exterior-right-front-three-quarter.webp'),
                                ),
                              ),
                              Text(
                                "Specifications",
                                style: TextStyle(fontSize: 25),
                              ),
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 98,
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      child: Text(
                                        snapshot.data[0]['type_of_gear'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 98,
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      child: Text(
                                        snapshot.data[0]['color_of_vehicle'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 98,
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      child: Text(
                                        snapshot.data[0]['seats_of_vehicle'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 100,
                                    width: 98,
                                    child: Card(
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(7.0),
                                      ),
                                      child: Text(
                                        snapshot.data[0]['fuel_of_vehicle'],
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 300,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 50.0, right: 50.0, top: 10.0),
                                child: Container(
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => Bokrent(widget.id)));
                                    },
                                    child: Text("book"),
                                  ),
                                ),
                              ),
                            ],
                          );
                          //
                        });
                  }
                })));
  }
}
