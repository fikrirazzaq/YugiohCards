# Yugioh Cards Sample App

All data are collected from https://db.ygoprodeck.com/api-guide/.

I apply MobX as state management for this app. At this time, I only implement the list of cards with pagination and detail page. But, I will add some features like sorting, searching, and filter the cards based on availability of multiple parameters in the ygoprodeck.com api. In addition, I use [git-karma] for the commit messages conventions.
There are still room for improvements, so I'm open for any feedback. Sharing with one another helps us all grow and learn. ✌️

### Screenshots
<img height="480px" src="screenshot/list.png">
<img height="480px" src="screenshot/darkmode.png">
<img height="480px" src="screenshot/monstercard.png">
<img height="480px" src="screenshot/monstercarddark.png">
<img height="480px" src="screenshot/spellcard.png">
<img height="480px" src="screenshot/trapcard.png">


### Api Service
```
GET
https://db.ygoprodeck.com/api/v5/cardinfo.php
```

## Build App
This app required generated code. Here is the command:
```
flutter packages get
flutter packages run build_runner build
flutter run
```

## Libs Dependencies
* [mobx]
* [flutter_mobx]
* [provider]
* [chopper]
* [cached_network_image]
* [fluttertoast]
* [mobx_codegen]
* [build_runner]

## TO DO
- [x] Chopper for Network calls
- [x] Using Provider
- [ ] Favorite Cards using Moor
- [ ] ...

## Repository Created & Maintained By

### Fikri Razzaq

#Flutter Enthusiast, #Android Developer.

<a href="https://medium.com/@fikrirazzaq"><img src="https://github.com/aritraroy/social-icons/blob/master/medium-icon.png?raw=true" width="60"></a>
<a href="https://twitter.com/fikrirazzaq"><img src="https://github.com/aritraroy/social-icons/blob/master/twitter-icon.png?raw=true" width="60"></a>
<a href="https://linkedin.com/in/fikrirazzaq"><img src="https://github.com/aritraroy/social-icons/blob/master/linkedin-icon.png?raw=true" width="60"></a>

[mobx]: <https://pub.dev/packages/mobx>
[flutter_mobx]: <https://pub.dev/packages/flutter_mobx>
[provider]: <https://pub.dev/packages/provider>
[chopper]: <https://pub.dev/packages/chopper>
[cached_network_image]: <https://pub.dev/packages/cached_network_image>
[fluttertoast]: <https://pub.dev/packages/fluttertoast>
[mobx_codegen]: <https://pub.dev/packages/mobx_codegen>
[build_runner]: <https://pub.dev/packages/build_runner>
[git-karma]: <http://karma-runner.github.io/4.0/dev/git-commit-msg.html>
