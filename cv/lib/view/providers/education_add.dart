import 'package:cv/view/Modal/education_modal.dart';
import 'package:flutter/cupertino.dart';

class Educ with ChangeNotifier {
  final List<Education> _edu = [];
  List<Education> get edu => _edu;

  void addLt(Education value) {
    _edu.add(value);
    notifyListeners();
  }

  void removeLt(int value) {
    _edu.removeAt(value);
    notifyListeners();
  }
}
