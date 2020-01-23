import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthycash/src/utils/input_text.dart';
import 'package:healthycash/src/utils/responsive.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = Responsive(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body:  GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: size.width,
              height: size.height,
              child: _body(context, responsive),
            ),
          ),
          );
  }

  Widget _body(BuildContext context, Responsive responsive) {
    return SingleChildScrollView(
          child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              _encabezado(context, responsive),
              _formLogin(context, responsive)
            ],
          )
        ],
      ),
    );
  }

  Widget _encabezado(BuildContext context, Responsive responsive) {
    return Container(
      height: responsive.ip(50),
      child: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 100,
              left: 20,
              child: Text('HealthyCash',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      shadows: <Shadow>[
                       Shadow(
                         blurRadius: 2.0,
                         color: Colors.black45,
                         offset: Offset(5.0, 6.0)
                       )
                      ]
                      )
            )),
            Positioned(
              top: 80,
              right: 10,
              child: Image.asset(
                'assets/img/cash.png',
                height: 120,
              ),
            ),
            Positioned(
                top: 98,
                right: 45,
                child: Icon(Icons.favorite, color: Colors.red, size: 30,)),
          ],
        ),
      ),
    );
  }

  Widget _formLogin(BuildContext context, Responsive responsive) {
    return Container(
      height: responsive.hp(70),
      width: responsive.wp(95),
      child: Column(
        children: <Widget>[
          InputText(label: 'Correo Electrónico',fontSize: 20),
          InputText(label: 'Contraseña',fontSize: 20),
            SizedBox(height: 30),          
            _botones(context, responsive),
        ],
      )
    );
  }

   Widget _botones(BuildContext context, Responsive responsive) {
    return Container(
     child: ConstrainedBox(
       constraints: BoxConstraints(
         maxWidth: 350,
         minWidth: 350
       ),
            child: Row(
         mainAxisAlignment: MainAxisAlignment.end,
         children: <Widget>[
           CupertinoButton(
               padding: EdgeInsets.symmetric(
                                  vertical: responsive.ip(2), horizontal: responsive.ip(5)),
             color: Colors.blueAccent,
             borderRadius: BorderRadius.circular(4),
             child: Text('Registrarse'),
             onPressed: () {},
           ),
           SizedBox(width: 20),
           CupertinoButton(
               padding: EdgeInsets.symmetric(
                                  vertical: responsive.ip(2),horizontal: responsive.ip(5)),
             color: Colors.blueAccent,
             borderRadius: BorderRadius.circular(4),
             child: Text('Iniciar Sesión'),
             onPressed: () {},
           )
         ],
       ),
     ),
    );
  }


}
