import 'package:demo_app/auth/model/login_resonse_model.dart';
import 'package:demo_app/network/api.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final Api api = Api();

  String? emailErrorMessage;
  String? passwordErrorMessage;

  bool _validateInput(String email, String passwrod) {
    emailErrorMessage = null;
    passwordErrorMessage = null;
    if (email.isEmpty) {
      emailErrorMessage = "Email is required.";
      return false;
    }
    if (passwrod.isEmpty) {
      passwordErrorMessage = "Password is required.";
      return false;
    }

    return true;
  }

  void login(String email, String passwrod) async {
    if (_validateInput(email, passwrod)) {
      LoginResponseModel? responseModel =
          await api.login(email: email, password: passwrod);

      if (responseModel != null) {
        print('user login successful');
      } else {
        print('user login failed');
      }
    }
  }

  String? get getEmailErrorMessage => this.emailErrorMessage;

  set setEmail(String? emailErrorMessage) {
    this.emailErrorMessage = emailErrorMessage;
    notifyListeners();
  }

  get getPassword => this.passwordErrorMessage;

  set setPassword(passwordErrorMessage) {
    this.passwordErrorMessage = passwordErrorMessage;
    notifyListeners();
  }
}
