import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SetSplashEvent>((event, emit) async {
     
      emit(SplashLoading());
      await Future.delayed(const Duration(seconds: 3), () {
      
        print('go to the next page');
      });
      emit(SplashLoaded());
    });
  }
}
