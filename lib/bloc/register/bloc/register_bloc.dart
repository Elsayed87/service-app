import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:service_app/repository/register_repo/register_repo.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterRepo registerRepo = RegisterRepo();
  RegisterBloc(this.registerRepo) : super(RegisterInitial()) {
    on<RegisterEventPressed>((event, emit) async{
      emit(RegisterLoading());
      try {
        var user =await  registerRepo.postUser(
            name: event.name,
            email: event.email,
            password: event.password,
            cityId: event.city_id);
        emit(RegisterSucsses(token: user.toString()));
        print('this is the token i have got ${user.toString()}');
      } catch (e) {
        emit(RegisterFailure(errorMessage: e.toString()));
      }
    });
  }
}
