import 'package:flutter/material.dart';

header({bool isAppTitle = false, String AppTitle}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      isAppTitle ? "FlutterShare" : AppTitle,
      style: TextStyle(
          fontFamily: isAppTitle ? "Kalam" : "",
          fontSize: isAppTitle ? 40 : 22),
    ),
  );
}
