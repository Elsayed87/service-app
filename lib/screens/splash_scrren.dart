import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_app/bloc/splash/bloc/splash_bloc.dart';
import 'package:service_app/screens/home_screen.dart';
import 'package:service_app/screens/login_screen.dart';
import 'package:service_app/screens/register_screen.dart';
import 'package:service_app/service/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  countDownTime() async {
    // var x =CacheHelper.getData("saveToken");
    // if(x!=null){
    //          Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomeScreen()),
    //       );

    // }else{
    //          Navigator.push(
    //         context,
    //         MaterialPageRoute(builder: (context) => RegisterScreen()),
    //       );

    // }
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    return Timer(
      Duration(seconds: 3),
      () async {
        //.getData("saveToken")
        String? uid = await CacheHelper.getData("saveToken");
        if (uid != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegisterScreen()),
          );
        }
      },
    );
  }

  @override
  void initState() {
    BlocProvider.of<SplashBloc>(context).add(SetSplashEvent());
    countDownTime();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          if (state is SplashLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          } else if (state is SplashLoaded) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //       onTap: () {
                  //   Navigator.push<void>(
                  //     context,
                  //     MaterialPageRoute<void>(
                  //       builder: (BuildContext context) => LoginScreen(),
                  //     ),
                  //   );
                  // },
                  Image.asset(
                    "assets/images/ftest.jpg",
                    width: 250,
                    height: 350,
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
