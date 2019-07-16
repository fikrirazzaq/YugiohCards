import 'dart:convert';

import 'package:card_app/data/api_service.dart';
import 'package:card_app/serializers/card.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

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
  increaseNumOfCards(BuildContext context) {
    numOfCards = numOfCards + 6;
    getCardsList(context);
  }

  @action
  filterCardList(int filter) {}

  @action
  getCardsList(BuildContext context) {
    fetchCardsList(numOfCards, filterUrl, context).then((retrievedCards) {
      cardsList = retrievedCards;
    });
  }
}

Future<List<YgoCard>> fetchCardsList(
    int numOfCards, String url, BuildContext context) async {
  final res = await Provider.of<ApiService>(context).getAllCards(numOfCards);

  List<YgoCard> cards = List<YgoCard>();

  if (res.isSuccessful) {
    Iterable cardList = json.decode(res.body);
    cards = cardList.map((card) => YgoCard.fromJson(card)).toList();
    for (int i = 0; i < cards.length; i++) {
      print("KARTU ::::: ${cards[i].name}");
    }
    return cards;
  } else {
    throw Exception("Failed to load cards");
  }
}
