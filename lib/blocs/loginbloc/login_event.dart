part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginUserEvent extends LoginEvent {
  final String emailAddress;
  final String password;
  LoginUserEvent(this.emailAddress, this.password);
  @override
  List<Object> get props => [emailAddress, password];
}
