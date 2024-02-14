import 'package:flutter/material.dart';
import 'package:hello_howrld/data/data_person_constants.dart';
import 'package:hello_howrld/model/person.dart';
import 'package:hello_howrld/model/person_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class PersonDataSource {
  Future<Database> _getDataSource() async {
    return await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        await db.execute(createPessoasTable);
      },
      version: databaseVersion,
    );
  }

  Future<Person?> getByIndex(index) async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await _getDataSource();
    Person cliente = await db
        .rawQuery('SELECT * FROM Table LIMIT 1 OFFSET $index; ') as Person;

    return cliente;
  }

  Future<List<PersonModel>> getAll() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      final db = await _getDataSource();
      final List<Map<String, dynamic>> clientes =
          await db.query(pessoasTableName);
      var logger = Logger();
      logger.log(Logger.level, clientes);
      return List.generate(clientes.length, (index) {
        logger.log(Logger.level, PersonModel.fromMap(clientes[index]));
        return PersonModel.fromMap(clientes[index]);
      });
    } catch (e) {
      return List.empty();
    }
  }

  Future<void> insertPerson(Person person) async {
    // Get a reference to the database.

    WidgetsFlutterBinding.ensureInitialized();

    final db = await _getDataSource();
    /*person.id = await db.rawInsert(
        '''insert into $pessoasTableName($pessoasColumnNome, $pessoasColumnIdade)
      VALUES('${person.name}', ${person.age})
    ''');*/
    await db.insert(
      pessoasTableName,
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    db.close();
  }
}
