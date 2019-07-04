
import 'dart:convert';

import 'package:card_app/serializers/card.dart';
import 'package:card_app/utils/constants.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;

part 'cards.g.dart';

class Cards = CardsBase with _$Cards;

abstract class CardsBase with Store {
  CardsBase();

  @observable
  List<Card> cardsList = List<Card>();

  @action
  getCardsList() {
    fetchCardsList().then((retreivedCards) {
        cardsList = retreivedCards;
    });
  }
}

Future<List<Card>> fetchCardsList() async {
  final response = await http.get(Constants.cardList(10));
  List<Card> cards = List<Card>();

  if (response.statusCode == 200) {
    Iterable cardList = json.decode(response.body);
    cards = cardList.map((card) => Card.fromJson(card)).toList();
    for (int i = 0; i < cards.length; i++) {
      print("KARTU OJIG ::::: ${cards[i].name}");
    }
    return cards;
  } else {
    throw Exception("Failed to load cards");
  }
}

