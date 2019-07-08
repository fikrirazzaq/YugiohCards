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
  List<YgoCard> cardsList = List<YgoCard>();

  @observable
  int numOfCards = 6;

  @observable
  String filterUrl = "";

  @action
  increaseNumOfCards() {
    numOfCards = numOfCards + 6;
    getCardsList();
  }

  @action
  getCardsList() {
    fetchCardsList(numOfCards, filterUrl).then((retrievedCards) {
      cardsList = retrievedCards;
    });
  }
}

Future<List<YgoCard>> fetchCardsList(int numOfCards, String url) async {
  print("atep ${createUrl(url, numOfCards)}");
  final response = await http.get(createUrl(url, numOfCards));
  List<YgoCard> cards = List<YgoCard>();

  if (response.statusCode == 200) {
    Iterable cardList = json.decode(response.body);
    cards = cardList.map((card) => YgoCard.fromJson(card)).toList();
    for (int i = 0; i < cards.length; i++) {
      print("KARTU OJIG ::::: ${cards[i].name}");
    }
    return cards;
  } else {
    throw Exception("Failed to load cards");
  }
}

String createUrl(String url, int numOfCards) {
  return "${Constants.cardList()}?num=$numOfCards$url";
}
