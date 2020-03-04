import 'package:flutter/material.dart';
import 'package:healthycash/src/pages/add_page.dart';
import 'package:healthycash/src/pages/home_page.dart';
import 'package:healthycash/src/pages/login_page.dart';

Map<String,WidgetBuilder> getAplicationRoutes(){
  return <String, WidgetBuilder>{
    'login' : (BuildContext context) => LoginPage(),
    'home'  : (BuildContext context) => HomePage(),
    'add'   : (BuildContext context) => AddPage()
  };
}