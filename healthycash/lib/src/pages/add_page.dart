import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthycash/src/widgets/category_selector_widget.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String category;
  double value = 0;
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

  _categorySelector() {
    return Container(
      height: 80,
      child: CategorySelectorWidget(
        categories: {
          'Shopping': Icons.shopping_cart,
          "Alcohol": FontAwesomeIcons.beer,
          "Fast food": FontAwesomeIcons.hamburger,
          "Bills": FontAwesomeIcons.wallet
        },
        onValueChanged: (newCategory) => category = newCategory,
      ),
    );
  }

  _currentValue() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 32),
      child: Text(
        "\$${value.toStringAsFixed(2)}",
        style: TextStyle(
            fontSize: 50,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  _num(String text, double height) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() {
          value = value * 10 + int.parse(text);
        });
      },
      child: Container(
          height: height,
          child: Center(
              child: Text(
            text,
            style: TextStyle(fontSize: 40.0, color: Colors.grey),
          ))),
    );
  }

  _numPad() {
    return Expanded(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      var height = constraints.biggest.height / 4;
      return Table(
        border: TableBorder.all(color: Colors.grey, width: 1.0),
        children: [
          TableRow(children: [
            _num('1', height),
            _num('2', height),
            _num('3', height)
          ]),
          TableRow(children: [
            _num('4', height),
            _num('5', height),
            _num('6', height),
          ]),
          TableRow(children: [
            _num('7', height),
            _num('8', height),
            _num('9', height),
          ]),
          TableRow(children: [
            _num('.', height),
            _num('0', height),
            GestureDetector(
              onTap: () {
                setState(() {
                  value = value ~/ 10.toInt() + (value - value.toInt());
                });
              },
              child: Container(
                  height: height,
                  child: Center(
                      child: Icon(
                    Icons.backspace,
                    color: Colors.grey,
                    size: 40.0,
                  ))),
            ),
          ]),
        ],
      );
    }));
  }

  _submit() {
    return Builder(builder: (BuildContext context) {
      return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: MaterialButton(
            child: Text(
              'Add Expense',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              if (value > 0 && category != '') {
                //Guardar valores
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Selecciona un valor y una categoria'),
                ));
              }
            }),
      );
    });
  }
}
