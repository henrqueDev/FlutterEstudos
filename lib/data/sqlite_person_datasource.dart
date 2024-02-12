import 'package:flutter/material.dart';
import 'package:hello_howrld/data/data_person_constants.dart';
import 'package:hello_howrld/model/person.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class PersonDataSource {
  Future<Database> _getDataSource() async {
    await deleteDatabase(
      join(await getDatabasesPath(), databaseName),
    );

    return await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        await db.execute(createPessoasTable);
      },
      version: databaseVersion,
    );
  }

  Future<void> insertPerson(Person person) async {
    // Get a reference to the database.

    WidgetsFlutterBinding.ensureInitialized();

    final db = await _getDataSource();
    await db.rawInsert(
        '''insert into $pessoasTableName($pessoasColumnNome, $pessoasColumnIdade)
      VALUES('${person.name}', ${person.age})
    ''');
    /*await db.insert(
      'persons',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );*/
  }
}
