import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';

part 'login_state.dart';

/*
Login process:
Version 1.0.0
- verify if email is valid (?),
- authentication repository signIn() calls the user repository getUserWithEmailAndPassword()
- user repository checks in sqflite DB if there is user with given credentials
- if DB has the user getUserWithEmailAndPassword() returns the user
- authentication repository saves email and password in secured storage
- authentication repository emits status: AuthStatus.unauthenticated to witch
  authentication BLoC reacts.
 */

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthRepoI authenticationRepository,
  })  : _aRepo = authenticationRepository,
        super(const LoginState()) {
    on<SignInFormSubmitted>(_onSignInSubmitted);
    on<ForgotPassword>(_onForgotPassword);
    on<LoginError>(_onLoginError);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
  }

  final AuthRepoI _aRepo;

  void _onSignInSubmitted(
    SignInFormSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.status == LoginStatus.isValidated) {
      // when LoginPasswordChanged and LoginEmailChanged events occurs
      // bloc verify if email or password are valid and sets status property in state
      emit(state.copyWith(status: LoginStatus.loading));
      try {
        await _aRepo.signIn(
          email: state.email,
          password: state.password,
        );
        emit(state.copyWith(status: LoginStatus.success));
      } catch (e) {
        emit(state.copyWith(
            status: LoginStatus.failure, errorMsg: e.toString()));
      }
    }
  }

  void _onForgotPassword(
    ForgotPassword event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(status: LoginStatus.forgotPass, email: event.email));
    try {
      // emit(state.copyWith(status: LoginStatus.forgotPass, email: event.email));
    } catch (e) {
      emit(state.copyWith(status: LoginStatus.failure, errorMsg: e.toString()));
    }
  }

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final _e = event.email;
    // check if email is valid and add status: valid or not
    emit(state.copyWith(email: _e));
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final _p = event.password;
    // check if password is valid and add status: valid or not ?
    emit(state.copyWith(password: _p));
  }

  void _onLoginError(
    LoginError event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(status: LoginStatus.failure, errorMsg: event.msg));
  }
}
