import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:blaa/utils/enums/authentication_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_state.dart';

/*
Registration process:
Version 1.0.0
- verify if email and password are valid,
- authentication repository signUp() calls the user repository createUser()
- user repository saves user data in sqflite local database (db gives the new user id)
- authentication repository saves email and password in secured storage
- authentication repository emits status: AuthStatus.unauthenticated to witch
  authentication BLoC reacts.
- authentication BLoC calls user repository login method to perform login

 */

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit({required this.authenticationRepository})
      : super(const RegistrationState());

  final AuthRepoI<AuthStatus> authenticationRepository;

  void onUsernameChanged(String value) {
    emit(state.copyWith(username: value));
  }

  void onEmailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void onPasswordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void onLangToLearnChanged(String value) {
    emit(state.copyWith(langToLearn: value));
  }

  void onNativeLangChanged(String value) {
    emit(state.copyWith(nativeLang: value));
  }

  void onFormStatusChanged(FormSubmissionStatus status) {
    emit(state.copyWith(formStatus: status));
  }

  void onFormSubmit() async {
    emit(state.copyWith(formStatus: FormSubmissionStatus.submitting));
    try {
      await authenticationRepository.signUp(
          email: state.email,
          username: state.username,
          password: state.password,
          langToLearn: state.langToLearn,
          nativeLang: state.nativeLang);
      emit(state.copyWith(
          formStatus: FormSubmissionStatus.success, email: '', password: ''));
    } catch (e) {
      // authenticationRepository.signUp throws Exceptions
      print(e);
      emit(state.copyWith(
          formStatus: FormSubmissionStatus.failed,
          errorMessage: e.toString(),
          password: ''));
    }
  }
}
