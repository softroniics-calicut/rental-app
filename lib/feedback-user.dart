import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Feedbackaa extends StatefulWidget {
  const Feedbackaa({Key? key}) : super(key: key);

  @override
  State<Feedbackaa> createState() => _FeedbackaaState();
}

class _FeedbackaaState extends State<Feedbackaa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
        centerTitle: true,
        leading: Icon(
            Icons.home

        ),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(child: Text('FEEDBACK', style:  TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),
          ],
        ),
      ),
    );
  }
}