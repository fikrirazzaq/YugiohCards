import 'package:card_app/models/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Consumer<Settings>(
      builder: (context, value, _) => Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
        ),
        body: Column(
          children: <Widget>[
            Observer(
              builder: (_) => Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: SwitchListTile(
                  title: Text("Dark mode"),
                  subtitle: Text("Use dark mode layout"),
                  value: value.useDarkMode,
                  onChanged: (bool val) {
                    value.setDarkMode(val);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
