import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  bool isScure = false;
  
  void changeScure() {
    isScure = !isScure;

    emit(SecureSuccess());
  }
}
