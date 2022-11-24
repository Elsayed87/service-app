import 'dart:convert';

import 'package:service_app/models/login_model.dart';

import 'package:http/http.dart' as http;
import 'package:service_app/service/cache_helper.dart';

const uri = 'https://api.monoservices.net/v1/auth/login';

class LoginService {
  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    final myToken = await CacheHelper.getData("tokenlogin");
    print("before is ${myToken}");

    //Data().token

    Map<String, String> headers = {
      // 'Authorization': 'Bearer $myToken',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: body,
    );

    var json = jsonDecode(response.body);
    //print(json);

    // var data = LoginModel.fromJson(json['message']).message!.token;
    var data = Message.fromJson(json['message']).token;
    print(data);
    final saveToken = await CacheHelper.saveData("saveToken", data);
    final getToken =  CacheHelper.getData("saveToken");
      print(" as per amr request getToken is  : ${getToken}");
    print(" as per amr request : ${saveToken}");

    return data;
  }
}
