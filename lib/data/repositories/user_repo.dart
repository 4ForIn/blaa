import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/providers/db/sqlflite_db/sqflite_db.dart';
import 'package:blaa/data/providers/storage_secured/storage_secured.dart';
import 'package:blaa/domain/repository/user_repo_i.dart';

// implementation
// query the current user from the backend
class UserRepo implements UserRepoI<User> {
  static final UserRepo _inst = UserRepo._();

  // static UserRepo _inst;
  static User? _user;

  // final _ss = StorageSecured();
  final _db = SqfliteDb.instance;

  UserRepo._();

  // UserRepo._() { _inst = this; }

  factory UserRepo() {
    return _inst;
    // _inst ?? UserRepo._();
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

  @override
  Future<User?> getUserWithEmailAndPassword(
      String email, String password) async {
    // check in DB if there is a user with given credentials
    try {
      User? _userFromDb = await _db.getUserFromDbByEmail(email);
      return _user = _userFromDb;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<int?> createUser(User newUser) async {
    String _timeStamp = DateTime.now().toIso8601String();
    User _userNoId = newUser.copyWith(id: null, created: _timeStamp);
    try {
      User? _userFromDb = await _db.createUser(_userNoId);
      _user = _userFromDb;
      return _userFromDb?.id;
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<int?> removeUser(int id) {
    // TODO: implement removeUser
    throw UnimplementedError();
    // returns removed user id null if error
  }

  // handle logIn
  // when login bloc is submitted - calls authRepo login()
  @override
  Future<int?> loginUserWithEmailPassword(String email, String password) async {
    int? _id;
    // check in DB if there is a user with given credentials
    // if DB has the user hasCreatedUser() returns the id or null
    try {
      _id = await _db.hasCreatedUser(email, password);
      if (_id != null) {
        // fetch user data from Db and set static User? _user;
        await getUser(email);
      }
      return _id;
    } catch (e) {
      throw Exception(e);
    }
  }
}
