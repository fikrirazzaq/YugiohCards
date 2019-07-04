import 'package:card_app/models/cards.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _cards = Cards();


  @override
  void initState() {
    super.initState();
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cards.getCardsList();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
