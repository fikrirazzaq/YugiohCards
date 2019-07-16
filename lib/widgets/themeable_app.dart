import 'package:card_app/models/settings.dart';
import 'package:card_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ThemeableApp extends StatelessWidget {
  final Settings settings;
  ThemeableApp(this.settings, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        var themeData = ThemeData(
          brightness: settings.useDarkMode == true ? Brightness.dark : Brightness.light,
          primarySwatch: Colors.orange,
        );
        return MaterialApp(
          title: 'Yugioh Cards',
          theme: themeData,
          home: Home(),
        );
      },
    );
  }
}