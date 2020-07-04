import 'package:flutter/material.dart';

circularProgress() {
  return Center(child: Container(child: CircularProgressIndicator()));
}

linearProgress() {
  return Container(padding: EdgeInsets.only(bottom: 10.0),child: LinearProgressIndicator());
}
