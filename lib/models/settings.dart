import 'package:card_app/services/preferences_service.dart';
import 'package:mobx/mobx.dart';

part 'settings.g.dart';

class Settings = SettingsBase with _$Settings;

abstract class SettingsBase with Store {
  PreferencesService _preferencesService;

  @observable
  bool useDarkMode;

  SettingsBase(this._preferencesService) {
    useDarkMode = _preferencesService.useDarkMode;
  }

  @action
  void setDarkMode(bool updatedDarkModePref) {
    _preferencesService.useDarkMode = updatedDarkModePref;
    useDarkMode = updatedDarkModePref;
  }
}