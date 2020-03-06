import 'package:flutter/material.dart';
import 'package:healthycash/src/app/routes.dart';
import 'package:healthycash/src/pages/login_page.dart';
 
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggin = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'healthyCash',
      //initialRoute: 'login',
      routes: getAplicationRoutes(),
      onGenerateRoute: (RouteSettings setting){
            return MaterialPageRoute(
              builder: (BuildContext context) => LoginPage()
            );
          },
      theme: ThemeData(
        primaryColor: Colors.lightGreen
      ),
    );
  }
}