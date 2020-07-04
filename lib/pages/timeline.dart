import 'package:flutter/material.dart';
import 'package:fluttershare/widgets/header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(isAppTitle: true),
      body: Center(
        child: Text("Timeline"),
      ),
    );
  }
}
