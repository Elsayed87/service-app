part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEventPressed extends RegisterEvent {
  final String name;
  final String email;
  final String password;
  final String city_id;

  const RegisterEventPressed(
      {required this.name,
      required this.email,
      required this.password,
      required this.city_id});
}
