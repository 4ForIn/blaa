// 1) when sign up: save email and token (at the beginning from password)
// in flutter secure storage and add more info to database (languages, name)
// Then sign the registered user in.
//
// 2) when sign out: remove token from secure storage
//
// 3) when sign in: check if in DB there is an user with given @ and pass.
// if there is -> sign in (in dev mode)
//
// when app starts: check if in secure storage there is any @ and token and try
// to sign in with this credentials [ tryToSignIn()  ].

import 'dart:async';

import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/providers/storage_secured/storage_secured.dart';
import 'package:blaa/data/repositories/user_repo.dart';
import 'package:blaa/domain/repository/auth_repo_i.dart';
import 'package:blaa/domain/repository/user_repo_i.dart';
import 'package:blaa/utils/enums/authentication_status.dart';

// enum AuthStatus { unknown, authenticated, registered, unauthenticated }

// Authentication Repository (AuthRepo) implements
// Authentication Repository Interface (AuthRepoI<T>) to fulfil Domain's contract
// exposes a Stream of AuthStatus to notify the application when a user signs in or out.

class AuthRepo implements AuthRepoI<AuthStatus> {
  AuthRepo(this.userRepository);
  final UserRepoI<User> userRepository;

  final _controller = StreamController<AuthStatus>();
  // flutter secure storage object:
  final StorageSecured _storage = StorageSecured();

  @override
  Stream<AuthStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    String? _currentUserEmail;
    // check if in DB there is a user with given credentials
    // if there is it will be returned
    // save email and password in secured storage
    // _controller.add(AuthStatus.authenticated);
    try {
      _currentUserEmail = await _storage.getEmail();
      String? _currentUSerPassword = await _storage.getToken();
      if (_currentUserEmail == email && _currentUSerPassword == password) {
        _controller.add(AuthStatus.authenticated);
      } else {
        _controller.add(AuthStatus.unauthenticated);
      }
    } catch (e) {
      _controller.add(AuthStatus.unauthenticated);
      throw Exception(
          'Registration process not finished. Error: ${e.toString()}');
    }
    return _currentUserEmail;
  }

  @override
  Future<int?> signUp({
    required String email,
    required String username,
    required String password,
    required String langToLearn,
    required String nativeLang,
  }) async {
    User _tempU = const User().copyWith(
      email: email,
      name: username,
      password: password,
      langToLearn: langToLearn,
      nativeLang: nativeLang,
    );
    try {
      // save new user data into local database or Firebase!
      // userRepository.createUser() returns id or null
      int? _res = await userRepository.createUser(_tempU);
      if (_res != null) {
        await _storage.persistEmailAndToken(email, password);
        _controller.add(AuthStatus.authenticated);
        // when state is registered, AuthBloc will perform call to
        // userRepo for user detail info.
      } else {
        _controller.add(AuthStatus.unauthenticated);
         return null;
      }
    } catch (e) {
      _controller.add(AuthStatus.unauthenticated);
      throw Exception(
          'Registration process not finished. Error: ${e.toString()}');
    }
  }

  @override
  void signOut() {
    _storage.deleteToken();
    _controller.add(AuthStatus.unauthenticated);
  }

  // when app starts check if there is the signed in user:
  // if is, there will are email and token in secured storage
  @override
  Future<void> tryToSignInAtStart() async {
    try {
      String? _tk = await _storage.getToken();
      String? _em = await _storage.getEmail();
      if (_em != null && _tk != null) {
        /// TODO: check for more data in database
        await Future.delayed(
          const Duration(milliseconds: 300),
          () => _controller.add(AuthStatus.authenticated),
        );
      } else {
        // in secure storage there is no token or email
        // can not login
        print('Can not sign in');
        _controller.add(AuthStatus.unauthenticated);
      }
    } catch (_) {
      _controller.add(AuthStatus.unauthenticated);
    }
  }

  @override
  void dispose() => _controller.close();
}
