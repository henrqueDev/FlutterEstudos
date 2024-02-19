// ignore_for_file: file_names

import 'package:hello_howrld/data/instituicoes/data_instituicoes_constants.dart';

const String clientesTableName = "clientes";

const String clientesColumnID = "id";

const String clientesColumnNome = "nome";

const String clientesColumnIdade = "idade";

const String clientesColumnSaldo = "saldo";

const String clientesColumnInstituicaoFK = "instituicao_fk";

const String createClientesTable = '''
  CREATE TABLE $clientesTableName(
    $clientesColumnID INTEGER PRIMARY KEY, 
    $clientesColumnNome TEXT, 
    $clientesColumnIdade INTEGER, 
    $clientesColumnSaldo FLOAT,
    $clientesColumnInstituicaoFK INTEGER,
    FOREIGN_KEY $clientesColumnInstituicaoFK REFERENCES $instituicoesTableName($instituicoesColumnID)
  )
''';
