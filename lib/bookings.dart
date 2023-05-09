import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:vehicleportaladmin/view_bike.dart';

import 'con.dart';




class booking extends StatefulWidget {
  const booking({Key? key}) : super(key: key);

  @override
  State<booking> createState() => bookingState();
}

class bookingState extends State<booking> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("my bookings "),

        centerTitle: true,
      ),

      body: ListView(




        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        shrinkWrap: true,
        // itemCount: products.length,
        // itemBuilder: (context, index) {
        children: [


          Card(
            color: Colors.blueGrey.shade200,
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(height: 80,
                    width: 80,
                    child: Image.asset("lib/assets/img/Pulsar-125-AmbaBajaj1.webp"),),

                  SizedBox(
                    width: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5.0,
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          text: TextSpan(
                            text: 'Name: bajaj pulsur',
                            style: TextStyle(
                                color: Colors.blueGrey.shade800,
                                fontSize: 16.0),
                            children: [
                            ]
                          ),
                        ),Container(
                          height: 30,
                          width: 65,
                          child:InkWell(
                            onTap: () {
                            },
                            child: Card(
                              elevation:3.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              color: Colors.red,
                              child: Text("cancel",style:TextStyle(fontSize: 22),),

                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),

            ),
          ),
        ],

      ),

    );
  }



}

