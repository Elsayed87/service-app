import 'package:service_app/web_service/login_service.dart';

class LoginRepo {
  LoginService loginService = LoginService();

  Future<dynamic> loginUser({
    required String email,
    required String password,
  }) async {
    var userLogin =
        await loginService.loginUser(email: email, password: password);
    return userLogin;
  }
}
