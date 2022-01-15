part of 'login_bloc.dart';

enum LoginStatus {initial, failure, isValidated, loading, success, forgotPass}

class LoginState extends Equatable {
  const LoginState({
    this.status = LoginStatus.initial,
    this.email = '',
    this.errorMsg,
    this.password = ''
});

  final LoginStatus status;
  final String email;
  final String? errorMsg;
  final String password;

  LoginState copyWith({
    LoginStatus? status,
    String? email,
    String? errorMsg,
    String? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      errorMsg: errorMsg ?? this.errorMsg,
      password: password ?? this.password,
    );
  }

  @override
  List<Object?> get props => [email, errorMsg, password, status];
}


/*abstract class LoginState extends Equatable {
  const LoginState();
}

class LoginInitial extends LoginState {
  @override
  List<Object> get props => [];
}
class LoginLoading extends LoginState {
  @override
  List<Object> get props => [];
}

class LoginFailure extends LoginState {
  final String error;

  const LoginFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure { error: $error }';
}*/
