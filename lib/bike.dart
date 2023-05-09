import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vehicleportaladmin/view.dart';
import 'package:vehicleportaladmin/view_bike.dart';
import 'con.dart';

class bike extends StatefulWidget {
  const bike({Key? key}) : super(key: key);

  @override
  State<bike> createState() => _bikeState();
}

class _bikeState extends State<bike> {


  Future<dynamic> getData() async {
    print('object');
    var response = await get(Uri.parse('${Con.url}viewrentalb.php'));
    print(response.body);
    var res = jsonDecode(response.body);
    return res;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Bike",style: TextStyle(color: Colors.black),),
        // backgroundColor: Color(0xFF84EE9),
        centerTitle: true,

      ),

      body:  FutureBuilder(
          future: getData(),
          builder: (context,snapshot) {
            if(snapshot.hasData){

              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(snapshot.data![index]['name']),
                    subtitle: Text(snapshot.data![index]['price']),
                    leading: Image.network('https://thumbs.dreamstime.com/z/little-baby-crawl-reading-big-book-isolated-white-background-baby-student-100046244.jpg',width: 80,height: 80,),
                    trailing: ElevatedButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return viewb(id:snapshot.data![index]['rental_id']);
                      },));
                    },child: Text("Viewdetails"),),
                  );


                },


              );


            }
            else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else{
              return Center(child: Text('No Content'));
            }

          }
      ),

    );

  }
}
