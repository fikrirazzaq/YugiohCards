import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_app/models/monsters.dart';
import 'package:card_app/serializers/card.dart';
import 'package:card_app/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class MonsterCardsPage extends StatefulWidget {
  @override
  _MonsterCardsPageState createState() => _MonsterCardsPageState();
}

class _MonsterCardsPageState extends State<MonsterCardsPage> {
  ScrollController _scrollController = ScrollController();

  final _cards = Monsters();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cards.getCardsList();

    _scrollController.addListener(() async {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        await _cards.increaseNumOfCards();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Monster Cards"),
      ),
      body: Observer(
        builder: (context) => RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                await _cards.increaseNumOfCards();
              },
              child: Container(
                child: Observer(
                  builder: (_) => ((_cards.cardsList != null) &&
                          (_cards.cardsList.isNotEmpty))
                      ? ListView.builder(
                          controller: _scrollController,
                          itemCount: _cards.cardsList.length,
                          itemBuilder: (_, index) {
                            final card = _cards.cardsList[index];
                            return _cardContainer(
                                card, index, _cards.cardsList.length);
                          },
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        ),
                ),
              ),
            ),
      ),
    );
  }

  Widget _cardContainer(YgoCard card, int index, int length) {
    return Container(
      padding: EdgeInsets.only(
          left: 8,
          right: 8,
          top: index == 0 ? 10 : 2,
          bottom: index == length - 1 ? 10 : 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
        child: Row(
          children: <Widget>[
            CachedNetworkImage(
              height: SizeConfig.blockSizeVertical * 20,
              imageUrl: card.cardImages[0].imageUrlSmall,
              placeholder: (context, url) => Container(
                    margin: EdgeInsets.only(left: 24, right: 24),
                    child: CircularProgressIndicator(),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Container(
              height: SizeConfig.blockSizeVertical * 20,
              width: SizeConfig.blockSizeHorizontal * 65,
              padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    child: Text(
                      card.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 2, bottom: 4),
                    child: Text(
                      card.type,
                      style: TextStyle(
                        fontSize: 12,
                        color: cardTypeColor(card.type),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      card.desc,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color cardTypeColor(String type) {
    if (type.toLowerCase().contains('spell')) {
      return Colors.green;
    } else if (type.toLowerCase().contains('skill')) {
      return Colors.green;
    } else if (type.toLowerCase().contains('monster')) {
      return Colors.brown;
    } else if (type.toLowerCase().contains('trap')) {
      return Colors.purpleAccent;
    } else {
      return Colors.teal;
    }
  }
}
