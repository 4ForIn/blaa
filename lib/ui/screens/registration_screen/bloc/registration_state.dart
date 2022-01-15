part of 'registration_cubit.dart';

enum FormSubmissionStatus { initial, submitting, success, failed }

class RegistrationState extends Equatable {
  const RegistrationState(
      {this.nativeLang = '',
      this.username = '',
      this.email = '',
      this.errorMessage,
      this.password = '',
      this.langToLearn = '',
      this.formStatus = FormSubmissionStatus.initial});

  bool get isUsernameValid => username.length > 4;
  bool get isEmailValid => email.length > 4 && email.contains('@');
  bool get isPasswordValid => username.length > 4;

  final String username;
  final String email;
  final String? errorMessage;
  final String password;
  final String langToLearn;
  final String nativeLang;
  final FormSubmissionStatus formStatus;

  RegistrationState copyWith({
    String? username,
    String? email,
    String? errorMessage,
    String? password,
    String? langToLearn,
    String? nativeLang,
    FormSubmissionStatus? formStatus,
  }) {
    return RegistrationState(
      username: username ?? this.username,
      email: email ?? this.email,
      errorMessage: errorMessage ?? this.errorMessage,
      password: password ?? this.password,
      langToLearn: langToLearn ?? this.langToLearn,
      nativeLang: nativeLang ?? this.nativeLang,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        email,
        errorMessage,
        formStatus,
        langToLearn,
        nativeLang,
        password,
        username
      ];
}

// class RegistrationInitial extends RegistrationState {
//   @override
//   List<Object> get props => [];
// }
