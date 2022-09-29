

import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getCustomText(
    String title ,
    double fontSize,
    ) {
  return Text(
    title,style: TextStyle(
    color: Colors.black,
    fontSize: fontSize,
    fontWeight: FontWeight.bold
  ),

  );
}