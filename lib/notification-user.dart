import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'con.dart';

class notfy extends StatefulWidget {
  const notfy({Key? key}) : super(key: key);

  @override
  State<notfy> createState() => _notfyState();
}

class _notfyState extends State<notfy> {
  Future<dynamic> getData() async{
    var response= await get(Uri.parse('${Con.url}notification.php'));
    var res=jsonDecode(response.body);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification"),
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
                      subtitle: Text(snapshot.data![index]['time']),
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
              return Center(child: Text("No notification"));
            }
          }
      ),
    );
  }
}
