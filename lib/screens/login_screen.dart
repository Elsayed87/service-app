import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_app/bloc/login/bloc/login_bloc.dart';
import 'package:service_app/const/app_color.dart';
import 'package:service_app/const/sized_hight.dart';
import 'package:service_app/const/string.dart';
import 'package:service_app/screens/home_screen.dart';
import 'package:service_app/screens/register_screen.dart';
import 'package:service_app/service/cache_helper.dart';
import 'package:service_app/shared/widgets/app_custom_button.dart';
import 'package:service_app/shared/widgets/app_text.dart';
import 'package:service_app/shared/widgets/custom_textformfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(children: [
                  AppHightSizedBox.sizedBox20,
                  Image.asset("assets/images/login-2.png"),
                  AppHightSizedBox.sizedBox20,
                  CustomTextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    lableText: 'Enter Your Email',
                    onChanged: (data) {},
                  ),
                  AppHightSizedBox.sizedBox20,
                  CustomTextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.number,
                    lableText: 'Enter Your Password',
                    onChanged: (data) {},
                  ),
                  AppHightSizedBox.sizedBox20,
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginLoading) {
                        print("login loading .....");
                      } else if (state is LoginSucsess) {
                        CacheHelper.saveData("tokenlogin", state.userLoginToken)
                            .then((value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, homeScreen, (route) => false);
                        });

                        print("${state.userLoginToken}");
                      } else if (state is LoginFauilre) {
                        // print("error at login model.....");
                        print("${state.errorMessage}");
                      }
                    },
                    builder: (context, state) {
                      return AppCustomButton(
                        color: Colors.lightBlueAccent,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<LoginBloc>(context).add(
                                LoginEventPressed(
                                    email: emailController.text,
                                    password: passwordController.text));
                          }
                        },
                        text: 'Login'.toUpperCase(),
                      );
                    },
                  ),
                  AppHightSizedBox.sizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                          flex: 3,
                          child: AppText(
                              text: "You don'/t have an account please ?",
                              fontSize: 16)),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  RegisterScreen(),
                            ),
                          );
                        },
                        child: AppText(
                            fontSize: 18.0,
                            text: 'Sign Up',
                            color: AppColor.appPrimaryColor),
                      )),
                    ],
                  )
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
