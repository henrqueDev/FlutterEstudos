// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  late int? id;
  late Float? saldo;
  final String nome;
  final String numero_celular;
  final int? instituicao_fk;

  Cliente({
    this.id,
    this.saldo,
    required this.nome,
    required this.numero_celular,
    required this.instituicao_fk,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'saldo': saldo,
      'nome': nome,
      'numero_celular': numero_celular,
      'instituicao_fk': instituicao_fk
    };
  }

  @override
  String toString() {
    return 'Person{id: $id, nome: $nome, saldo: $saldo, numero_celular: $numero_celular, instituicao_fk: $instituicao_fk}';
  }

  @override
  List<Object?> get props => [id, saldo];
}
