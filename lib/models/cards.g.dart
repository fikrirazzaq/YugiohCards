// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Cards on CardsBase, Store {
  final _$cardsListAtom = Atom(name: 'CardsBase.cardsList');

  @override
  List<YgoCard> get cardsList {
    _$cardsListAtom.context.enforceReadPolicy(_$cardsListAtom);
    _$cardsListAtom.reportObserved();
    return super.cardsList;
  }

  @override
  set cardsList(List<YgoCard> value) {
    _$cardsListAtom.context.conditionallyRunInAction(() {
      super.cardsList = value;
      _$cardsListAtom.reportChanged();
    }, _$cardsListAtom, name: '${_$cardsListAtom.name}_set');
  }

  final _$numOfCardsAtom = Atom(name: 'CardsBase.numOfCards');

  @override
  int get numOfCards {
    _$numOfCardsAtom.context.enforceReadPolicy(_$numOfCardsAtom);
    _$numOfCardsAtom.reportObserved();
    return super.numOfCards;
  }

  @override
  set numOfCards(int value) {
    _$numOfCardsAtom.context.conditionallyRunInAction(() {
      super.numOfCards = value;
      _$numOfCardsAtom.reportChanged();
    }, _$numOfCardsAtom, name: '${_$numOfCardsAtom.name}_set');
  }

  final _$filterUrlAtom = Atom(name: 'CardsBase.filterUrl');

  @override
  String get filterUrl {
    _$filterUrlAtom.context.enforceReadPolicy(_$filterUrlAtom);
    _$filterUrlAtom.reportObserved();
    return super.filterUrl;
  }

  @override
  set filterUrl(String value) {
    _$filterUrlAtom.context.conditionallyRunInAction(() {
      super.filterUrl = value;
      _$filterUrlAtom.reportChanged();
    }, _$filterUrlAtom, name: '${_$filterUrlAtom.name}_set');
  }

  final _$CardsBaseActionController = ActionController(name: 'CardsBase');

  @override
  dynamic increaseNumOfCards() {
    final _$actionInfo = _$CardsBaseActionController.startAction();
    try {
      return super.increaseNumOfCards();
    } finally {
      _$CardsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterCardList(int filter) {
    final _$actionInfo = _$CardsBaseActionController.startAction();
    try {
      return super.filterCardList(filter);
    } finally {
      _$CardsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCardsList() {
    final _$actionInfo = _$CardsBaseActionController.startAction();
    try {
      return super.getCardsList();
    } finally {
      _$CardsBaseActionController.endAction(_$actionInfo);
    }
  }
}
