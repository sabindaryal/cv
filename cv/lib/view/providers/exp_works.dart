import 'package:cv/view/Modal/exprinece_worksModal.dart';
import 'package:flutter/cupertino.dart';

class ExpWorks with ChangeNotifier {
  final List<WorksModal> _worksList = [];
  List<WorksModal> get workList => _worksList;

  void addWorks(WorksModal value) {
    _worksList.add(value);
    notifyListeners();
  }

  void removeWorks(int value) {
    _worksList.removeAt(value);
    notifyListeners();
  }
}
