import 'dart:convert';

import 'package:service_app/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/service/cache_helper.dart';

const uri = 'https://api.monoservices.net/v1/auth/register';

class UserService {
  Future<dynamic> postUser(
      {required String name,
      required String email,
      required String password,
      required String cityId}) async {
    final myToken = await CacheHelper.getData("token");
    
    //Data().token

    Map<String, String> headers = {
     // 'Authorization': 'Bearer $myToken',
      'Content-Type': 'application/json'
    };
    final body = jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "city_id": cityId
    });

    http.Response response = await http.post(
      Uri.parse(uri),
      headers: headers,
      body: body,
    );

    var json = jsonDecode(response.body);
    //print(json);
    var data = Data.fromJson(json['data']).token;

    return data;
  }
}
