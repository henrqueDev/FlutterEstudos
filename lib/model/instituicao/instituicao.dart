// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Instituicao extends Equatable {
  late int? id;
  final String nome;
  //late List<Cliente>? clientes;

  Instituicao({this.id, required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }

  @override
  List<Object> get props => [nome];
}
