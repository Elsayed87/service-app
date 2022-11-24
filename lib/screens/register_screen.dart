import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:service_app/bloc/register/bloc/register_bloc.dart';
import 'package:service_app/const/app_color.dart';
import 'package:service_app/const/sized_hight.dart';
import 'package:service_app/const/string.dart';
import 'package:service_app/screens/login_screen.dart';
import 'package:service_app/service/cache_helper.dart';
import 'package:service_app/shared/widgets/app_custom_button.dart';
import 'package:service_app/shared/widgets/app_text.dart';
import 'package:service_app/shared/widgets/custom_textformfield.dart';


class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cityIdController = TextEditingController();
  var nameController = TextEditingController();
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
                  Image.asset("assets/images/sign-up.png"),
                  AppHightSizedBox.sizedBox20,
                  CustomTextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    lableText: 'Enter Your Name',
                    onChanged: (data) {},
                  ),
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
                  CustomTextFormField(
                    controller: cityIdController,
                    keyboardType: TextInputType.number,
                    lableText: 'Enter Your City Id',
                    onChanged: (data) {},
                  ),
                  AppHightSizedBox.sizedBox20,
                  BlocConsumer<RegisterBloc, RegisterState>(
                    listener: (context, state) {
                      if (state is RegisterLoading) {
                       // print('loading');
                      } else if (state is RegisterSucsses) {
                        CacheHelper.saveData("token", state.token)
                            .then((value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, homeScreen, (route) => false);
                        });
                      } else {
                       // print('error');
                      }
                    },
                    builder: (context, state) {
                      return AppCustomButton(
                        color: Colors.lightBlueAccent,
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<RegisterBloc>(context).add(
                                RegisterEventPressed(
                                    city_id: cityIdController.text,
                                    email: emailController.text,
                                    name: emailController.text,
                                    password: passwordController.text));
                          }
                        },
                        text: 'Sign Up'.toUpperCase(),
                      );
                    },
                  ),
                  AppHightSizedBox.sizedBox20,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Expanded(
                          flex: 2,
                          child: AppText(
                              text: "If You  have an account please ?",
                              fontSize: 16)),
                      Expanded(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => LoginScreen(),
                            ),
                          );
                        },
                        child: AppText(
                            fontSize: 18.0,
                            text: 'Sign In',
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
