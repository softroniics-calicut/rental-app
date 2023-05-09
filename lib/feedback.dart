import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'con.dart';

class feedback extends StatefulWidget {
  const feedback({Key? key}) : super(key: key);

  @override
  State<feedback> createState() => _feedback();
}

class _feedback extends State<feedback> {
  Future<dynamic> getData() async {
    var response = await get(Uri.parse('${Con.url}feedback.php'));
    var res = jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("feedback"),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data![index]['feedback']),

                            trailing: Text(snapshot.data![index]['date']),
                    );
                  }
              );
            }

            else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            else {
              return Center(child: Text("No feedback"));
            }
          }
      ),
    );
  }
}