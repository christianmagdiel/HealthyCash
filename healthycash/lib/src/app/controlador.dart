import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ControladorPage extends StatefulWidget {
  @override
  _ControladorPageState createState() => _ControladorPageState();
}

class _ControladorPageState extends State<ControladorPage> {

  @override
  void initState() { 
    super.initState();
    this._ckeck();
  }

  _ckeck() async{
    bool isLoggin = false;
    if (isLoggin) {
      Navigator.pushReplacementNamed(context, 'home');
    } else {
      Navigator.pushReplacementNamed(context, 'home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CupertinoActivityIndicator(
          radius: 15,
        ),
      ),
    );
  }
}