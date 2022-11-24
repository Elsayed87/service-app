import 'package:service_app/web_service/user_service.dart';

class RegisterRepo {
  UserService userService = UserService();

  Future<dynamic> postUser(
      {required String name,
      required String email,
      required String password,
      required String cityId}) async {
    var userToken = await userService.postUser(
        name: name, email: email, password: password, cityId: cityId);
    return userToken;
  }
}
