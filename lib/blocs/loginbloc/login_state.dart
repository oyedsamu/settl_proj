part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginLoadingState extends LoginState {
  @override
  List<Object> get props => [];
}

class GenerateOtpLoginSuccessState extends LoginState {
  final String phoneNumber;

  GenerateOtpLoginSuccessState(this.phoneNumber);

  @override
  List<Object> get props => [phoneNumber];
}

class GenerateOtpLoginErrorState extends LoginState {
  final String errorMessage;

  GenerateOtpLoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class VerifyOtpLoginSuccessState extends LoginState {
  VerifyOtpLoginSuccessState();

  @override
  List<Object> get props => [];
}

class VerifyOtpLoginErrorState extends LoginState {
  final String errorMessage;

  VerifyOtpLoginErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class LoginSuccessState extends LoginState {
  LoginSuccessState();

  @override
  List<Object?> get props => [];
}

class LoginFailure extends LoginState {
  final String errorMessage;
  LoginFailure(this.errorMessage);

  @override
  List<Object?> get props => [];
}
