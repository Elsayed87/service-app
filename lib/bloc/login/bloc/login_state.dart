part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucsess extends LoginState {
  final String userLoginToken;

  LoginSucsess({required this.userLoginToken});
}

class LoginFauilre extends LoginState {
  final String errorMessage;

  LoginFauilre({required this.errorMessage});
}
