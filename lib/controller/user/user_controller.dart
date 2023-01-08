import 'package:appsi/data/user/user.dart';
import 'package:flutter/material.dart';

import '../../data/const.dart';

class UserController extends ChangeNotifier {
  final User _user = user;
  bool isLoggedIn = false;

  User get profile => _user;

  void login() {
    isLoggedIn = true;
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    notifyListeners();
  }
}
