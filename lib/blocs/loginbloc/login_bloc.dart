import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:settl_proj/data/repository.dart';
import 'package:settl_proj/data/signin_response_model.dart';
import 'package:settl_proj/presentation/utils.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository _loginRepository;

  LoginBloc(this._loginRepository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginUserEvent) {
      yield LoginLoadingState();
      try {
        Utils.showLog("LoginBloc", "LoginUserEvent: called");
        SignInResponseModel loginUserModel = await _loginRepository
            .loginUserWithPassword(event.emailAddress, event.password);
        if (loginUserModel.message == "successful") {
          // Save Token
          // Navigate to the HomePage
          yield VerifyOtpLoginSuccessState();
        } else {
          yield VerifyOtpLoginErrorState(loginUserModel.message!);
        }
        Utils.showLog("LoginBloc", loginUserModel.toString());
      } catch (e) {
        Utils.showLog(
            "LoginBloc", "VerifyOtpLoginEvent: exception ${e.toString()}");
        yield VerifyOtpLoginErrorState("Oops an error occur, Try again later");
      }
    }
  }

  void loginUser(String emailAddress, String password) {
    add(LoginUserEvent(emailAddress, password));
  }
}
