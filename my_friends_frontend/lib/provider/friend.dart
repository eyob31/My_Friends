import 'package:flutter/cupertino.dart';

class Friend with ChangeNotifier {
  String name;
  String email;
  String birthDay;
  String description;
  String phoneNumber;
  bool hasDebt;
  bool isFavorite;

  Friend(
      {required this.name,
      required this.email,
      required this.birthDay,
      this.hasDebt = false,
      required this.phoneNumber,
      this.isFavorite = false,
      required this.description});

  void toggleHasDebt() {
    hasDebt = !hasDebt;
    notifyListeners();
  }

  void toggleisFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
