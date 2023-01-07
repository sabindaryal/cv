import 'package:cv/view/Modal/language_modal.dart';
import 'package:flutter/cupertino.dart';

class Langu with ChangeNotifier {
  final List<Lang> _languageList = [];
  List<Lang> get languageList => _languageList;

  void addLanguage(Lang value) {
    _languageList.add(value);
    notifyListeners();
  }

  void removeLanguage(int value) {
    _languageList.removeAt(value);
    notifyListeners();
  }
}
