// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:hello_howrld/data/clientes/data_cliente_constants.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClienteModel extends Cliente {
  ClienteModel({
    id,
    required nome,
    required saldo,
    required numero_celular,
    required instituicao_fk,
  }) : super(
            id: id,
            nome: nome,
            saldo: saldo,
            numero_celular: numero_celular,
            instituicao_fk: instituicao_fk);

  factory ClienteModel.fromMap(Map<String, Object?> map) {
    return ClienteModel(
        id: map[clientesColumnID],
        nome: map[clientesColumnNome],
        saldo: map[clientesColumnSaldo],
        numero_celular: map[clientesColumnNumeroCelular],
        instituicao_fk: map[clientesColumnInstituicaoFK]);
  }
}
