import 'package:hello_howrld/data/clientes/data_cliente_constants.dart';
import 'package:hello_howrld/data/instituicoes/data_instituicoes_constants.dart';
import 'package:hello_howrld/data/preferences/data_preferences_constants.dart';

const String databaseName = "lanchonete.db";

const int databaseVersion = 1;

const createAllTables = [
  createInstituicoesTable,
  createClientesTable,
  createTablePreferences
];
