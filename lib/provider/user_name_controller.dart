import 'package:flutter/material.dart';

class UserNameProvider extends ChangeNotifier {
  String? _userName;
  String? get userName => _userName;
  void setUserName(String newUserName) {
    _userName = newUserName;

    debugPrint('UserNameProvider: setUserName -> "$_userName"');
    notifyListeners();
  }
}
