import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenu = 0;

  int get selectedMenu {
    return this._selectedMenu;
  }

  set selectedMenu(int index) {
    this._selectedMenu = index;
    notifyListeners();
  }
}
