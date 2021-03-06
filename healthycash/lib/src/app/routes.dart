import 'package:flutter/material.dart';
import 'package:healthycash/src/app/controlador.dart';
import 'package:healthycash/src/pages/add_page.dart';
import 'package:healthycash/src/pages/home_page.dart';
import 'package:healthycash/src/pages/login_page.dart';

import '../pages/home_page.dart';
import '../pages/login_page.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  // bool _isLoggin = false;
  return <String, WidgetBuilder>{
    'controlador': (BuildContext context) => ControladorPage(),
    '/': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    // '/': (BuildContext context) {
    //   if (_isLoggin) {
    //     return HomePage();
    //   } else {
    //     return LoginPage();
    //   }
    // },
    'add': (BuildContext context) => AddPage()
  };
}
