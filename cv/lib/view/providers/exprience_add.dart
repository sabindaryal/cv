import 'package:cv/view/Modal/expriendModal.dart';
import 'package:flutter/cupertino.dart';

class Exprience with ChangeNotifier {
  final List<ExprienceModal> _exprienceList = [];
  List<ExprienceModal> get exprienceList => _exprienceList;

  void addExprience(ExprienceModal value) {
    _exprienceList.add(value);
    notifyListeners();
  }

  void removeExprience(int value) {
    _exprienceList.removeAt(value);
    notifyListeners();
  }
}
