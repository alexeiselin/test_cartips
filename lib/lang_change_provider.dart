import 'package:flutter/material.dart';


class LangChangeProvider with ChangeNotifier {
  Locale _currentLocale = const Locale('ru') ;
  Locale get currentLocale => _currentLocale;

  void changeLocale(String locale)  {
    _currentLocale = Locale(locale);

    notifyListeners();
  }
}