import 'package:flutter/cupertino.dart';

class HomePageProvider with ChangeNotifier {
  String msg = "";
  bool? eligible;
  void CheckEligiblity(int age) {
    if (age > 18) {
      msg = "You Are Eligible";
      eligible = true;
      notifyListeners();
    } else {
      msg = "You Are Not Eligible";
      eligible = false;
      notifyListeners();
    }
  }
}
