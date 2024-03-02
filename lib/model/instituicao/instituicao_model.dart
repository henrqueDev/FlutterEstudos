// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:hello_howrld/data/instituicoes/data_instituicoes_constants.dart';
import 'package:hello_howrld/model/instituicao/instituicao.dart';

class InstituicaoModel extends Instituicao {
  InstituicaoModel({
    id,
    required nome,
  }) : super(
          id: id,
          nome: nome,
        );

  factory InstituicaoModel.fromMap(Map<String, Object?> map) {
    return InstituicaoModel(
      id: map[instituicoesColumnID],
      nome: map[instituicoesColumnNome],
    );
  }
}
