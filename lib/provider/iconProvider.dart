// ignore_for_file: file_names
import 'package:flutter/material.dart';

class IconProvider extends ChangeNotifier {
  bool isSelected = true;
  bool changeOb = true;
  bool firstValue = false;
  IconData icon = Icons.visibility_off;

  void changeIcon() {
    isSelected = !isSelected;
    icon = isSelected ? Icons.visibility_off : Icons.visibility;
    notifyListeners();
  }

  bool obscureText = false;

  void changeObt() {
    changeOb = !changeOb;
    obscureText = changeOb ? true : false;
    notifyListeners();
  }

  bool valuee = false;

  void changeCheckBox() {
    firstValue = !firstValue;
    valuee = firstValue ? true : false;
    notifyListeners();
  }
}
