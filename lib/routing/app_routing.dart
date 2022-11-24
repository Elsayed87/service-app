import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_app/bloc/login/bloc/login_bloc.dart';
import 'package:service_app/bloc/register/bloc/register_bloc.dart';
import 'package:service_app/bloc/splash/bloc/splash_bloc.dart';
import 'package:service_app/const/string.dart';
import 'package:service_app/repository/login_repo/login_repo.dart';
import 'package:service_app/repository/register_repo/register_repo.dart';
import 'package:service_app/screens/home_screen.dart';
import 'package:service_app/screens/login_screen.dart';
import 'package:service_app/screens/register_screen.dart';
import 'package:service_app/screens/splash_scrren.dart';

class AppRouting {
  static Route<dynamic> generteRouting(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider<SplashBloc>(
            create: (context) => SplashBloc(),
            child: const SplashScreen(),
          );
        });
      case loginScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(LoginRepo()),
            child: LoginScreen(),
          );
        });
      case registerScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return BlocProvider<RegisterBloc>(
            create: (context) => RegisterBloc(RegisterRepo()),
            child: RegisterScreen(),
          );
        });
      case homeScreen:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const HomeScreen();
        });
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(child: Text('there is no page ')),
      );
    });
  }
}
