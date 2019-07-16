import 'package:card_app/data/api_service.dart';
import 'package:card_app/models/cards.dart';
import 'package:card_app/models/monsters.dart';
import 'package:card_app/models/settings.dart';
import 'package:card_app/services/preferences_service.dart';
import 'package:card_app/widgets/themeable_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  _setupLogging();
  var sharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp(PreferencesService(sharedPreferences)));
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

class MyApp extends StatelessWidget {
  final PreferencesService _preferencesService;

  const MyApp(this._preferencesService);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          builder: (_) => ApiService.create(),
          dispose: (_, ApiService service) => service.client.dispose(),
        ),
        Provider<PreferencesService>(
          builder: (_) => _preferencesService,
        ),
        Provider<Settings>(
          builder: (_) => Settings(_preferencesService),
        ),
        Provider<Cards>(
          builder: (_) => Cards(),
        ),
        Provider<Monsters>(
          builder: (_) => Monsters(),
        ),
      ],
      child: Consumer<Settings>(
        builder: (context, value, _) => ThemeableApp(value),
      ),
    );
  }
}
