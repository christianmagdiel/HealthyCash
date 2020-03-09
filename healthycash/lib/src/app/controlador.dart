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

  _ckeck() async {
    bool isLoggin = false;
    if (isLoggin) {
      await Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, '/');
      });
    } else {
      await Future.delayed(Duration.zero, () {
        Navigator.pushReplacementNamed(context, 'login');
      });
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
