import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_app/serializers/card.dart';
import 'package:card_app/utils/constants.dart';
import 'package:card_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CardDetailPage extends StatefulWidget {
  final YgoCard card;

  CardDetailPage({Key key, @required this.card}) : super(key: key);

  @override
  _CardDetailPageState createState() => _CardDetailPageState();
}

class _CardDetailPageState extends State<CardDetailPage> {

  @override
  void initState() {
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: widget.card.name,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: cardTypeColor(widget.card.type),
        textColor: Colors.white,
        fontSize: 16.0
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Card Information"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          margin: EdgeInsets.all(12),
          width: SizeConfig.screenWidth,
          child: widget.card.type.toLowerCase().contains("monster")
              ? monsterCard()
              : spellCard(),
        ),
      ),
    );
  }

  Widget spellCard() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        cardImageContainer(),
        // Name
        spellNameContainer(),
        // Type
        spellTypeContainer(),
        // Race
        spellRaceContainer(),
        // Archetype
        spellArcheContainer(),
        // Desc
        descContainer(),
        // Sets
        setsContainer(),
      ],
    );
  }

  Widget monsterCard() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        cardImageContainer(),
        // Name
        monsterNameContainer(),
        // Type
        spellTypeContainer(),
        // Atk/Def
        atkDefContainer(),
        // Attribute
        attributeContainer(),
        // Race
        monsterRaceContainer(),
        // Archetype
        spellArcheContainer(),
        // Desc
        descContainer(),
        // Sets
        setsContainer(),
      ],
    );
  }

  Card cardImageContainer() {
    return Card(
      elevation: 6,
      child: Container(
        child: CachedNetworkImage(
          height: SizeConfig.blockSizeVertical * 35,
          imageUrl: "https://ygoprodeck.com/pics/${widget.card.id}.jpg",
        ),
      ),
    );
  }

  Container descContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                widget.card.desc,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container spellArcheContainer() {
    return widget.card.archetype != null
        ? Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            child: Row(
              children: <Widget>[
                CachedNetworkImage(
                  width: 12,
                  imageUrl: Constants.imgArchetype,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: Text("Archetype: "),
                ),
                Container(
                  child: Text(
                    widget.card.archetype,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          )
        : Container();
  }

  Container spellRaceContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 12,
            imageUrl: "${Constants.imgSpellTypeUrl}${widget.card.race}.png",
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("Type: "),
          ),
          Container(
            child: Text(
              widget.card.race,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  Container spellTypeContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 12,
            imageUrl: "${Constants.imgTypeUrl}${widget.card.type}.jpg",
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text(
              widget.card.type,
              style: TextStyle(
                  fontSize: 14,
                  color: cardTypeColor(widget.card.type),
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 4),
            child: Text("/ ID: ${widget.card.id}"),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container spellNameContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                widget.card.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container monsterRaceContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 12,
            imageUrl: "${Constants.imgMonsterTypeUrl}${widget.card.race}.png",
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("Type: "),
          ),
          Container(
            child: Text(
              widget.card.race,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black12,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  Container attributeContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          CachedNetworkImage(
            width: 12,
            imageUrl:
                "${Constants.imgMonsterTypeUrl}${widget.card.attribute}.jpg",
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("Attribute: "),
          ),
          Container(
            child: Text(
              widget.card.attribute,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container atkDefContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          Container(
            child: Text("ATK: "),
          ),
          Container(
            child: Text(
              widget.card.atk,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8),
            child: Text("DEF: "),
          ),
          Container(
            child: Text(
              widget.card.def,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container monsterNameContainer() {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                widget.card.name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            height: 12,
            margin: EdgeInsets.only(left: 8),
            child: CachedNetworkImage(imageUrl: Constants.imgLevelUrl),
          ),
          Container(
            margin: EdgeInsets.only(left: 2),
            child: Text(widget.card.level),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border.all(
              color: Colors.black12, width: 1, style: BorderStyle.solid)),
    );
  }

  Container setsContainer() {
    return widget.card.cardSets != null
        ? Container(
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: SizeConfig.blockSizeVertical * 2),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: Text(
                    "Sets",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(
                  height: 0.0,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.card.cardSets.length,
                  itemBuilder: (_, index) {
                    final set = widget.card.cardSets[index];
                    return Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 6, bottom: 6),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Text("(${set.setRarity}) "),
                              ),
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "${set.setName} ",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 8),
                                child: Text("\$${set.setPrice}"),
                              )
                            ],
                          ),
                        ),
                        Divider(
                          height: 0.0,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
          )
        : Container();
  }

  Color cardTypeColor(String type) {
    if (type.toLowerCase().contains('spell')) {
      return Colors.teal;
    } else if (type.toLowerCase().contains('skill')) {
      return Colors.teal;
    } else if (type.toLowerCase().contains('monster')) {
      return Colors.brown;
    } else if (type.toLowerCase().contains('trap')) {
      return Colors.pink[800];
    } else {
      return Colors.blueAccent;
    }
  }
}