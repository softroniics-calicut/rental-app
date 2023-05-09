import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'con.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  Future<List<dynamic>> getData() async{
    var response= await get(Uri.parse('${Con.url}payment.php'));
    var res=jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("payment"),
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
                      title: Text(snapshot.data![index]['name']),
                      subtitle: Text(snapshot.data![index]['amount' ]),
                      trailing: Text(snapshot.data![index]['date']),
                    );
                  }
              );
            }

            else if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            else
            {
              return Center(child: Text("No payments"));
            }
          }
      ),
    );
  }
}
