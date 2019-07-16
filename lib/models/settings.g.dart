// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Settings on SettingsBase, Store {
  final _$useDarkModeAtom = Atom(name: 'SettingsBase.useDarkMode');

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.context.enforceReadPolicy(_$useDarkModeAtom);
    _$useDarkModeAtom.reportObserved();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.context.conditionallyRunInAction(() {
      super.useDarkMode = value;
      _$useDarkModeAtom.reportChanged();
    }, _$useDarkModeAtom, name: '${_$useDarkModeAtom.name}_set');
  }

  final _$SettingsBaseActionController = ActionController(name: 'SettingsBase');

  @override
  void setDarkMode(bool updatedDarkModePref) {
    final _$actionInfo = _$SettingsBaseActionController.startAction();
    try {
      return super.setDarkMode(updatedDarkModePref);
    } finally {
      _$SettingsBaseActionController.endAction(_$actionInfo);
    }
  }
}
