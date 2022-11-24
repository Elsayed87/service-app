import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_app/bloc/login/bloc/login_bloc.dart';
import 'package:service_app/bloc/register/bloc/register_bloc.dart';
import 'package:service_app/bloc/splash/bloc/splash_bloc.dart';
import 'package:service_app/repository/login_repo/login_repo.dart';
import 'package:service_app/repository/register_repo/register_repo.dart';
import 'package:service_app/routing/app_routing.dart';
import 'package:service_app/service/cache_helper.dart';

import 'const/string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  String token = await CacheHelper.getData('token') ?? '';
  print('token: $token');
  runApp(const ServiceApp());
}

class ServiceApp extends StatelessWidget {
  const ServiceApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => SplashBloc()..add(SetSplashEvent()))),
        BlocProvider(
          create: ((context) => RegisterBloc(RegisterRepo())),
        ),
            BlocProvider(
          create: ((context) => LoginBloc(LoginRepo())),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: splashScreen,
        onGenerateRoute: AppRouting.generteRouting,
      ),
    );
  }
}
