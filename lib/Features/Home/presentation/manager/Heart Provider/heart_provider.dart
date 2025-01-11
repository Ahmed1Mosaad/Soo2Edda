import 'package:flutter/material.dart';

class HeartProvider extends ChangeNotifier {
  Map<int, bool> isSelected = {};

  bool getSelectedItem(int itemId) {
    return isSelected[itemId] ?? false;
  }

  void toggle({required int id}) {
    isSelected[id] = !(isSelected[id] ?? false);
    notifyListeners();
  }
}
