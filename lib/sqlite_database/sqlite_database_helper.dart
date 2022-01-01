import 'package:aman_task/contacts.dart';
import 'package:aman_task/location.dart';
import 'package:aman_task/sms.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();

  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('task.db');
    return _database!;
  }

  Future<Database> _initDB(String finalPath) async {
    final dbPath = await getDatabasesPath();
    final path = dbPath + finalPath;

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    await db.execute('''
      CREATE TABLE $tableLocation (${LocationFields.id} $idType, ${LocationFields.lat} $textType,${LocationFields.long} $textType)
    ''');

    await db.execute('''
      CREATE TABLE $tableContact (${ContactFields.id} $idType, ${ContactFields.name} $textType,${ContactFields.number} $textType)
    ''');

    await db.execute('''
      CREATE TABLE $tableSMS (${SMSFields.id} $idType, ${SMSFields.phone} $textType,${SMSFields.sms} $textType)
    ''');
  }

  /*

    All Crud Operations are not handled

   */
  Future<Location> createLocationEntry(Location location) async {
    final db = await instance.database;
    final id = await db.insert(tableLocation, location.toJson());
    return location.copy(id: id);
  }

  Future<ContactLocal> createContactEntry(ContactLocal contact) async {
    final db = await instance.database;
    final id = await db.insert(tableContact, contact.toJson());
    return contact.copy(id: id);
  }

  Future<SMS> createSMSEntry(SMS sms) async {
    final db = await instance.database;
    final id = await db.insert(tableSMS, sms.toJson());
    return sms.copy(id: id);
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }
}
