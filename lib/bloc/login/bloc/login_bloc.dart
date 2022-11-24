import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_app/models/login_model.dart';
import 'package:service_app/repository/login_repo/login_repo.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepo loginRepo = LoginRepo();

  LoginBloc(this.loginRepo) : super(LoginInitial()) {
    on<LoginEventPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        var loginUser = await loginRepo.loginUser(
            email: event.email, password: event.password);
        emit(LoginSucsess(userLoginToken: loginUser));
      } catch (e) {
        emit(LoginFauilre(errorMessage: e.toString()));
      }
    });
  }
}
