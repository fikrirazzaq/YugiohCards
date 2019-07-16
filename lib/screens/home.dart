import 'package:card_app/models/cards.dart';
import 'package:card_app/screens/all_cards_page.dart';
import 'package:card_app/screens/monster_cards_page.dart';
import 'package:card_app/screens/settings_page.dart';
import 'package:card_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  final widgetPager = [
    Consumer<Cards>(
      builder: (context, value, _) => AllCardsPage(),
    ),
    Consumer<Cards>(
      builder: (context, value, _) => MonsterCardsPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: Text(getTitle(selectedIndex)),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(),
                  ),
                );
              },
              icon: Icon(
                Icons.settings,
              ),
            )
          ],
        ),
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

  String getTitle(int index) {
    switch (index) {
      case 0:
        return "All Cards";
        break;
      case 1:
        return "Monster Cards";
        break;
      default:
        return "All Cards";
        break;
    }
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
              color: Colors.orange,
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
