import 'dart:convert';

import 'package:demo_app/auth/model/login_resonse_model.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<LoginResponseModel?> login(
      {required String email, required String password}) async {
    LoginResponseModel? loginResponseModel;

    var res = await http.post(
        Uri.parse('https://api-nodejs-todolist.herokuapp.com/user/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"email": email, "password": password}));

    if (res.statusCode == 200) {
      loginResponseModel = LoginResponseModel.fromJson(json.decode(res.body));
    }

    return loginResponseModel;
  }
}
