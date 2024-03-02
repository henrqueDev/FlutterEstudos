// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hello_howrld/data/database/database_constants.dart';
import 'package:hello_howrld/data/instituicoes/data_instituicoes_constants.dart';
import 'package:hello_howrld/model/instituicao/instituicao.dart';
import 'package:hello_howrld/model/instituicao/instituicao_model.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class InstituicoesDataSource {
  static Database? _instituicoesdataSource;

  InstituicoesDataSource._privateConstructor();
  static final InstituicoesDataSource instance =
      InstituicoesDataSource._privateConstructor();

  Future<Database?> _getInstituicoesDataSource() async {
    _instituicoesdataSource ??= await openDatabase(
      join(await getDatabasesPath(), databaseName),
      onCreate: (db, version) async {
        for (String query in createAllTables) {
          await db.execute(query);
        }
      },
      version: databaseVersion,
    );
    return _instituicoesdataSource;
  }

  Future<Instituicao?> getByIndex(index) async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await _getInstituicoesDataSource();
    Instituicao instituicao =
        await db?.rawQuery('SELECT * FROM Table LIMIT 1 OFFSET $index; ')
            as Instituicao;

    return instituicao;
  }

  Future<List<InstituicaoModel>> getAll() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      final db = await _getInstituicoesDataSource();
      final List<Map<String, Object?>>? Instituicoes =
          await db?.query(instituicoesTableName);
      var logger = Logger();
      logger.log(Logger.level, Instituicoes);
      return List.generate(Instituicoes!.length, (index) {
        logger.log(Logger.level, InstituicaoModel.fromMap(Instituicoes[index]));
        return InstituicaoModel.fromMap(Instituicoes[index]);
      });
    } catch (e) {
      return List.empty();
    }
  }

  Future<void> insertInstituicao(Instituicao instituicao) async {
    WidgetsFlutterBinding.ensureInitialized();

    final db = await _getInstituicoesDataSource();

    await db!.insert(
      instituicoesTableName,
      instituicao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
