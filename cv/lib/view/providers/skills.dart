import 'package:cv/view/Modal/skills_modal.dart';
import 'package:flutter/cupertino.dart';

class Skill with ChangeNotifier {
  final List<SkillsModal> _skillList = [];
  List<SkillsModal> get skillList => _skillList;

  void addSkill(SkillsModal value) {
    _skillList.add(value);
    notifyListeners();
  }

  void removeSkill(int value) {
    _skillList.removeAt(value);
    notifyListeners();
  }
}
