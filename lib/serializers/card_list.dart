// https://db.ygoprodeck.com/api/v5/cardinfo.php

class CardList {
  List cardIndexes = [];

  CardList({this.cardIndexes});

  factory CardList.fromJson(List<dynamic> cardList) {
    return CardList(cardIndexes: cardList);
  }
}
