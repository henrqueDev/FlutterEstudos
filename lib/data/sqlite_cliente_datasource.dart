import 'package:flutter/material.dart';
import 'package:hello_howrld/data/data_cliente_constants.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';
import 'package:hello_howrld/model/cliente/cliente_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DataSource {
  static Database? _dataSource;

  DataSource._privateConstructor();
  static final DataSource instance = DataSource._privateConstructor();

  Future<Database?> _getDataSource() async {
    _dataSource ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        await db.execute(createclientesTable);
      },
      version: databaseVersion,
    );
    return _dataSource;
  }

  Future<Cliente?> getByIndex(index) async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await _getDataSource();
    Cliente cliente = await db
        ?.rawQuery('SELECT * FROM Table LIMIT 1 OFFSET $index; ') as Cliente;

    return cliente;
  }

  Future<List<ClienteModel>> getAll() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      final db = await _getDataSource();
      final List<Map<String, Object?>>? clientes =
          await db?.query(clientesTableName);
      var logger = Logger();
      logger.log(Logger.level, clientes);
      return List.generate(clientes!.length, (index) {
        logger.log(Logger.level, ClienteModel.fromMap(clientes[index]));
        return ClienteModel.fromMap(clientes[index]);
      });
    } catch (e) {
      return List.empty();
    }
  }

  Future<void> insertCliente(Cliente cliente) async {
    WidgetsFlutterBinding.ensureInitialized();

    final db = await _getDataSource();

    await db!.insert(
      clientesTableName,
      cliente.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
