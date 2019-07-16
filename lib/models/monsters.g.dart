// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'monsters.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Monsters on MonstersBase, Store {
  final _$cardsListAtom = Atom(name: 'MonstersBase.cardsList');

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

  final _$numOfCardsAtom = Atom(name: 'MonstersBase.numOfCards');

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

  final _$filterTypeAtom = Atom(name: 'MonstersBase.filterType');

  @override
  String get filterType {
    _$filterTypeAtom.context.enforceReadPolicy(_$filterTypeAtom);
    _$filterTypeAtom.reportObserved();
    return super.filterType;
  }

  @override
  set filterType(String value) {
    _$filterTypeAtom.context.conditionallyRunInAction(() {
      super.filterType = value;
      _$filterTypeAtom.reportChanged();
    }, _$filterTypeAtom, name: '${_$filterTypeAtom.name}_set');
  }

  final _$MonstersBaseActionController = ActionController(name: 'MonstersBase');

  @override
  dynamic increaseNumOfCards(BuildContext context) {
    final _$actionInfo = _$MonstersBaseActionController.startAction();
    try {
      return super.increaseNumOfCards(context);
    } finally {
      _$MonstersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterCardList(String filterUrl, BuildContext context) {
    final _$actionInfo = _$MonstersBaseActionController.startAction();
    try {
      return super.filterCardList(filterUrl, context);
    } finally {
      _$MonstersBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getCardsList(BuildContext context) {
    final _$actionInfo = _$MonstersBaseActionController.startAction();
    try {
      return super.getCardsList(context);
    } finally {
      _$MonstersBaseActionController.endAction(_$actionInfo);
    }
  }
}
