
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomAction(IconData icon){
  return InkWell(
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Icon(icon),
    ),
    onTap: () {},
  );
}