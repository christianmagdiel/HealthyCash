import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthycash/src/widgets/bottomAppBar_widget.dart';
import 'package:healthycash/src/widgets/graph_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;
  int currentPage = 9;

  @override
  void initState() { 
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
      viewportFraction: 0.4
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        brightness: Brightness.dark,
        centerTitle: true,
        title: Row(
          children: <Widget>[
            Icon(Icons.monetization_on,
                size: 30, color: Theme.of(context).primaryColor),
            SizedBox(width: 10),
            Text('HealthyCash',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))
          ],
        ),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onSelected: (String value) {
              if (value == "exit") {
                print('Exit');
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "share",
                child: Text('Share App'),
              ),
              PopupMenuItem(
                value: "exit",
                child: Text('Exit App'),
              )
            ],
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            bottomAction(FontAwesomeIcons.history),
            bottomAction(FontAwesomeIcons.chartPie),
            SizedBox(width: 48.0),
            bottomAction(FontAwesomeIcons.wallet),
            bottomAction(Icons.settings)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.add)),
      //backgroundColor: Theme.of(context).primaryColor,
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: Column(
        children: <Widget>[
          _selector(),
          _expenses(),
          _graph(),
          Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 14.0,
          ),
          _list(),
        ],
      ),
    );
  }

  Widget _pageItem(String name, int position){
    var _alignment;

     final selected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: Colors.blueGrey,
    );
    final unselected = TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.normal,
      color: Colors.blueGrey.withOpacity(0.4),
    );

    if (position == currentPage) {
      _alignment = Alignment.center;
    } else if (position > currentPage) {
      _alignment = Alignment.centerRight;
    } else {
      _alignment = Alignment.centerLeft;
    }

    return Align(
      alignment: _alignment,
      child: Text(name,
        style: position == currentPage ? selected : unselected,
      ),
    );
  }

  Widget _selector() {
    return SizedBox.fromSize(
        size: Size.fromHeight(30.0),
        child: PageView(
          onPageChanged: (newPage){
            setState(() {
              currentPage = newPage;
            });
          },
          controller: _controller,
          children: <Widget>[
          _pageItem("Enero", 0),
          _pageItem("Febrero", 1),
          _pageItem("Marzo", 2),
          _pageItem("Abril", 3),
          _pageItem("Mayo", 4),
          _pageItem("Junio", 5),
          _pageItem("Julio", 6),
          _pageItem("Agosto", 7),
          _pageItem("Septiembre", 8),
          _pageItem("Octubre", 9),
          _pageItem("Noviembre", 10),
          _pageItem("Diciembre", 11),
          ],
        ));
  }

  Widget _expenses() {
    return Column(
      children: <Widget>[
        Text(
          "\$2000.25",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
        Text(
          'Gasto total',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.blueGrey),
        )
      ],
    );
  }

  Widget _graph() {
    return Container(height: 250.0, child: GraphWidget());
  }

  Widget _item(IconData icon, String nombre, int percent, double value) {
    return ListTile(
      leading: Icon(icon),
      title: Text(nombre,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
      subtitle: Text("$percent% of expenses",
          style: TextStyle(fontSize: 16.0, color: Colors.blueGrey)),
      trailing: Container(
          decoration: BoxDecoration(
              color: Colors.blueAccent.withOpacity(0.2),
              borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              '\$$value',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.0),
            ),
          )),
    );
  }

  Widget _list() {
    return Expanded(
      child: ListView.separated(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) =>
            _item(FontAwesomeIcons.shoppingCart, "Shopping", 14, 145.12),
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.blueAccent.withOpacity(0.15),
            height: 3.0,
          );
        },
      ),
    );
  }
}
