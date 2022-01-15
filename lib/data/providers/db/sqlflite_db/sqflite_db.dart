import 'package:blaa/data/model/user_m/user_m.dart';
import 'package:blaa/data/model/word_m/word_m.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'db_constants/db_constants.dart';

class SqfliteDb {
  static final SqfliteDb instance = SqfliteDb._init();
  static Database? _db;

  SqfliteDb._init();

  Future<Database> get database async {
    print('Future<Database> get database');
    if (_db != null) return _db!;

    _db = await _initDB('blaa.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    print('SqfliteDb _initDB');
    final String _dbPath = await getDatabasesPath();
    final _path = join(_dbPath, filePath);
    return await openDatabase(_path, version: 1, onCreate: _onCreate);
  }

  Future  _onCreate(Database db, int ver) async {
    print('SqfliteDb _initDB _onCreate');
    await db.execute(DbConst.createWordsTableStatement);
    await db.execute(DbConst.createUsersTableStatement);
  }

  Future<User> createUser(User newUser) async {
    final Database db = await instance.database;
    // newUser.created.toIso861String(); if there is a DateTime
    final int _id = await db.insert(DbConst.tableUsers, newUser.toJson());
    print('SqfliteDb user with id: $_id created');
    /*
     // to get created property from DB:
    final List<Map<String, Object?>> _res = await db.query(DbConst.tableUsers,
        columns: [DbConst.fUCreated],
        where: '${DbConst.fUId} = ?',
        whereArgs: [_id]);
    final String _created = _res.first.entries
        .firstWhere((e) => e.key == DbConst.fUCreated)
        .value as String;*/
    return newUser.copyWith(id: _id);
  }

  Future<User?> getUserFromDbByEmail(String userEmail) async {
    User? _response;
    try {
      final Database db = await instance.database;
      const List<String> _allColumns = DbConst.allUsersColumns;
      final List<Map<String, Object?>> res = await db.query(DbConst.tableUsers,
          columns: _allColumns,
          where: '${DbConst.fUEmail} = ?',
          whereArgs: [userEmail]);
      if (res.isNotEmpty) {
        _response = User.fromJson(res.first);
      }
      print(
          'SqfliteDb getUserFromDbByEmail: $userEmail. Response id: ${_response?.id}');
      return _response;
    } catch (e) {
      throw Exception(e);
    }
  }

  // ------- words -----------

  Future<Word> createWord(Word newWord) async {
    final Database db = await instance.database;
    // newUser.created.toIso861String(); if there is a DateTime
    final int _id = await db.insert(DbConst.tableWords, newWord.toJson());
    print(
        'SqfliteDb createWord langToLearn: ${newWord.langToLearn} created with  id: $_id created');
    /*


    final int _id2 = await db.rawInsert(
        'INSERT INTO table_name ("column1, col2") VALUES ("value1, val2"))');

     // to get created property from DB:
    final List<Map<String, Object?>> _res = await db.query(DbConst.tableUsers,
        columns: [DbConst.fUCreated],
        where: '${DbConst.fUId} = ?',
        whereArgs: [_id]);
    final String _created = _res.first.entries
        .firstWhere((e) => e.key == DbConst.fUCreated)
        .value as String;*/
    return newWord.copyWith(id: _id);
  }

  Future<List<Word>> getWords(int userId) async {
    List<Word> _response = [];
    try {
      final Database db = await instance.database;
      final List<String> _allColumns = DbConst.allWordsColumns;
      final List<Map<String, Object?>> res = await db.query(DbConst.tableWords,
          columns: _allColumns,
          // id is int, email is String!
          where: '${DbConst.fWUser} = ?',
          whereArgs: [userId]);
      /*final List<Map<String, Object?>> res2 = await db.rawQuery(
          'SELECT * FROM ${DbConst.tableWords} WHERE ${DbConst.fWUser}=?',
          [userId]);*/
      if (res.isNotEmpty) {
        _response = res.map((element) => Word.fromJson(element)).toList();
      }
      print('SqfliteDb getWords userId: $userId:  resp: $_response');
      return _response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future close() async {
    final Database _db = await instance.database;
    print('SqfliteDb db closed');
    _db.close();
  }
}
