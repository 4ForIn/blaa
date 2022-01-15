import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/providers/db/sqlflite_db/sqflite_db.dart';
import 'package:blaa/data/providers/storage_secured/storage_secured.dart';
import 'package:blaa/domain/repository/user_repo_i.dart';

// implementation
// query the current user from the backend
class UserRepo implements UserRepoI<User> {
  static final UserRepo _inst = UserRepo._();
  static User? _user;
  final _ss = StorageSecured();
  final _db = SqfliteDb.instance;

  UserRepo._();

  factory UserRepo() {
    return _inst;
  }

  @override
  Future<User?> get user => Future(() => _user);

  @override
  Future<User?> getUser(String email) async {
    try {
      User? _userFromDb = await _db.getUserFromDbByEmail(email);
      return _user = _userFromDb;
    } catch (e) {
      throw Exception(e);
    }
  }

  // when login bloc is submitted and calls authRepo login()
  Future<User?> getUserWithEmailAndPassword(
      String email, String password) async {
    // check in DB if there is a user with given credentials
    throw UnimplementedError();
  }

  @override
  Future<int?> createUser(User newUser) async {
    String _timeStamp = DateTime.now().toIso8601String();
    User _userNoId = newUser.copyWith(id: null, created: _timeStamp);
    User _userFromDb = await _db.createUser(_userNoId);

    _user = _userFromDb;
    return Future.delayed(const Duration(milliseconds: 300), () {
      print('created new user with email: ${newUser.email} ');
      _user = newUser;
      // returns user id created by database or null if error
      return _userFromDb.id;
    });
  }

  @override
  Future<int?> removeUser(int id) {
    // TODO: implement removeUser
    throw UnimplementedError();
    // returns removed user id null if error
  }
}
