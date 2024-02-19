// ignore_for_file: must_be_immutable

import 'dart:ffi';

import 'package:equatable/equatable.dart';

class Cliente extends Equatable {
  late int? id;
  late Float? saldo;
  final String nome;
  final int idade;

  Cliente({this.id, required this.idade, required this.nome, this.saldo});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'saldo': saldo,
      'nome': nome,
      'idade': idade,
    };
  }

  @override
  String toString() {
    return 'Person{id: $id, nome: $nome, idade: $idade, saldo: $saldo}';
  }

  @override
  List<Object?> get props => [id];
}
