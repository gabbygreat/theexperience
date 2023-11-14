import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:theexperience/models/custom_model.dart';

const String userTableName = 'user_table';

class LocalUserHistory {
  static final LocalUserHistory instance = LocalUserHistory._init();
  static Database? _database;
  LocalUserHistory._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('theexperience.db');
    return _database!;
  }

  set resetDatabase(value) {
    _database = value;
  }

  Future<Database> _initDB(String filePath) async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else if (Platform.isIOS) {
      directory = await getApplicationSupportDirectory();
    }
    final path = p.join(directory!.path, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
CREATE TABLE $userTableName (
  name TEXT NOT NULL,
  phone TEXT NOT NULL,
  email TEXT NOT NULL UNIQUE,
  gender TEXT NOT NULL,
  nationality TEXT NOT NULL
  )
''');
  }

  Future create(UserData user) async {
    final db = await instance.database;

    var batch = db.batch();
    batch.rawInsert(
      '''INSERT OR IGNORE INTO $userTableName (
        name,
        phone,
        email,
        gender,
        nationality
        )
        VALUES(?, ?, ?, ?, ?);
        ''',
      [
        user.name,
        user.phone,
        user.email,
        user.gender,
        user.nationality,
      ],
    );

    await batch.commit(noResult: true);
  }

  Future<List<UserData>> getAllUsers() async {
    final db = await instance.database;

    final conversation = await db.rawQuery("SELECT * FROM $userTableName");
    List<UserData> result = [];
    for (var i in conversation) {
      result.add(UserData.fromJson(i));
    }
    return result;
  }

  Future<UserData?> getUser() async {
    final db = await instance.database;
    final conversation = await db.rawQuery("SELECT * FROM $userTableName");
    if (conversation.isEmpty) return null;
    var data = UserData.fromJson(conversation.first);
    return data;
  }

  Future close() async {
    final db = await instance.database;
    _database = null;
    db.close();
  }
}
