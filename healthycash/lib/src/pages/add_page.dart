import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthycash/src/widgets/category_selector_widget.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text('Categoria'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        ),
        body: _body());
  }

  Widget _body() {
    return Column(
      children: <Widget>[
        _categorySelector(), 
        _currentValue(), 
        _numPad(),
        _submit()
        ],
    );
  }

  _categorySelector(){
    return Container(
      height: 80,
      child: CategorySelectorWidget(
        categories: {
          'Shopping' : Icons.shopping_cart,
          "Alcohol" : FontAwesomeIcons.beer,
          "Fast food" : FontAwesomeIcons.hamburger,
          "Bills" : FontAwesomeIcons.wallet
        },
      ),
    );
  } 
    

  _currentValue() => Placeholder(fallbackHeight: 120);

  _numPad() => Expanded(child: Placeholder());

  _submit() => Placeholder(fallbackHeight: 50);
}
