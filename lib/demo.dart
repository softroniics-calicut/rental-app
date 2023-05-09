import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'con.dart';

class Car extends StatefulWidget {
  const Car({Key? key}) : super(key: key);

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  Future<dynamic> getData() async{
    var response= await get(Uri.parse('${Con.url}viewrental.php'));
    var res=jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Car"),
        centerTitle: true,
      ),
      body:FutureBuilder(
          future: getData(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context,index)
                  {
                    return ListTile(
                      title: Text(snapshot.data![index]['message']),
                      subtitle: Text(snapshot.data![index]['price']),
                      trailing: Text(snapshot.data![index]['name']),
                    );
                  }
              );
            }

            else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else
            {
              return Center(child: Text("No notification"));
            }
          }
      ),
    );
  }
}
