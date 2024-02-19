// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:hello_howrld/data/clientes/data_cliente_constants.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClienteModel extends Cliente {
  ClienteModel({
    id,
    required nome,
    required idade,
    required saldo,
    required instituicao_fk,
  }) : super(
            id: id,
            nome: nome,
            idade: idade,
            saldo: saldo,
            instituicao_fk: instituicao_fk);

  factory ClienteModel.fromMap(Map<String, Object?> map) {
    return ClienteModel(
        id: map[clientesColumnID],
        idade: map[clientesColumnIdade],
        nome: map[clientesColumnNome],
        saldo: map[clientesColumnSaldo],
        instituicao_fk: map[clientesColumnInstituicaoFK]);
  }
}
