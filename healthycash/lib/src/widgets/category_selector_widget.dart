import 'package:flutter/material.dart';

class CategorySelectorWidget extends StatefulWidget {
  final Map<String, IconData> categories;

  const CategorySelectorWidget({Key key, this.categories}) : super(key: key);

  @override
  _CategorySelectorWidgetState createState() => _CategorySelectorWidgetState();
}

class CategoryWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final bool selected;

  const CategoryWidget({Key key, this.name, this.icon, this.selected})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                    color: selected ? Colors.blueAccent : Colors.grey,
                    width: selected ? 3.0 : 1.0)),
            child: Icon(icon),
          ),
          Text(name)
        ],
      ),
    );
  }
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  String currentItem = "";
  @override
  Widget build(BuildContext context) {
    var widgets = <Widget>[];

    widget.categories.forEach((name, icon) {
      widgets.add(GestureDetector(
        onTap: (){
          setState(() {
            currentItem = name;
          });
        },
        child: CategoryWidget(
          name: name,
          icon: icon,
          selected: name == currentItem,
        ),
      ));
    });
    return ListView(
      scrollDirection: Axis.horizontal,
      children: widgets,
    );
  }
}
