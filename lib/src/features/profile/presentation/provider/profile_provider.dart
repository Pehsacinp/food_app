import 'package:flutter/material.dart';

class ToggleProvider with ChangeNotifier {
  bool _isLogin = true; // Login için true, Register için false

  bool get isLogin => _isLogin;

  void setLogin(bool isLogin) {
    _isLogin = isLogin;
    notifyListeners();
  }

  bool _isObscure = true;

  bool get isObscure => _isObscure;

  void toggleVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  bool _isChecked = false;

  bool get isChecked => _isChecked;

  void toggleCheckbox(bool? value) {
    if (value != null) {
      _isChecked = value;
      notifyListeners();
    }
  }
}
