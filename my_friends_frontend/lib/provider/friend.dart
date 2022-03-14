import 'package:flutter/cupertino.dart';

class Friend with ChangeNotifier {
  String name;
  String birthDay;
  int phoneNumber;
  bool hasDebt;

  Friend(
      {required this.name,
      required this.birthDay,
      this.hasDebt = false,
      required this.phoneNumber});

  void toggleHasDebt() {
    hasDebt = !hasDebt;
    notifyListeners();
  }
}
