import 'package:flutter/material.dart';

class BottomNavBarProvider with ChangeNotifier {
  int currentIndex = 0;

  void selectedIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
