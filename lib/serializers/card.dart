import 'package:card_app/serializers/card_image.dart';
import 'package:card_app/serializers/card_price.dart';
import 'package:card_app/serializers/card_set.dart';

class YgoCard {
  String id;
  String name;
  String type;
  String desc;
  String atk;
  String def;
  String level;
  String race;
  String attribute;
  String archetype;
  List<CardSets> cardSets;
  List<CardImages> cardImages;
  CardPrices cardPrices;

  YgoCard(
      {this.id,
        this.name,
        this.type,
        this.desc,
        this.atk,
        this.def,
        this.level,
        this.race,
        this.attribute,
        this.archetype,
        this.cardSets,
        this.cardImages,
        this.cardPrices});

  YgoCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    desc = json['desc'];
    atk = json['atk'];
    def = json['def'];
    level = json['level'];
    race = json['race'];
    attribute = json['attribute'];
    archetype = json['archetype'];
    if (json['card_sets'] != null) {
      cardSets = new List<CardSets>();
      json['card_sets'].forEach((v) {
        cardSets.add(new CardSets.fromJson(v));
      });
    }
    if (json['card_images'] != null) {
      cardImages = new List<CardImages>();
      json['card_images'].forEach((v) {
        cardImages.add(new CardImages.fromJson(v));
      });
    }
    cardPrices = json['card_prices'] != null
        ? new CardPrices.fromJson(json['card_prices'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['desc'] = this.desc;
    data['atk'] = this.atk;
    data['def'] = this.def;
    data['level'] = this.level;
    data['race'] = this.race;
    data['attribute'] = this.attribute;
    data['archetype'] = this.archetype;
    if (this.cardSets != null) {
      data['card_sets'] = this.cardSets.map((v) => v.toJson()).toList();
    }
    if (this.cardImages != null) {
      data['card_images'] = this.cardImages.map((v) => v.toJson()).toList();
    }
    if (this.cardPrices != null) {
      data['card_prices'] = this.cardPrices.toJson();
    }
    return data;
  }
}