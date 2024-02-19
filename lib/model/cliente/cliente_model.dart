// ignore_for_file: must_be_immutable

import 'package:hello_howrld/data/data_cliente_constants.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClienteModel extends Cliente {
  ClienteModel({
    id,
    required nome,
    required idade,
    required saldo,
  }) : super(
          id: id,
          nome: nome,
          idade: idade,
          saldo: saldo,
        );

  factory ClienteModel.fromMap(Map<String, Object?> map) {
    return ClienteModel(
      id: map[clientesColumnID],
      idade: map[clientesColumnIdade],
      nome: map[clientesColumnNome],
      saldo: map[clientesColumnSaldo],
    );
  }
}
