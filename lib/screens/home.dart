import 'package:card_app/screens/all_cards_page.dart';
import 'package:card_app/screens/monster_cards_page.dart';
import 'package:card_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final widgetPager = [
    AllCardsPage(),
    MonsterCardsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.all_inclusive),
              title: Text('All Cards'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.child_care),
              title: Text('Monster Cards'),
            ),
          ],
          currentIndex: selectedIndex,
          fixedColor: Colors.deepPurpleAccent,
          onTap: onItemTapped,
        ),
        body: widgetPager.elementAt(selectedIndex),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _willPopCallback() async {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Quit App?"),
          actions: <Widget>[
            FlatButton(
              child: Text("CANCEL"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24)),
              color: Colors.deepPurple,
              child: Text(
                "YA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
    return Future.value(false);
  }
}