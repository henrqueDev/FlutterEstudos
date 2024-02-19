// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class Instituicao extends Equatable {
  late int? id;
  final String nome;
  late List<Cliente>? clientes;

  Instituicao({
    this.id,
    required this.nome,
    this.clientes,
  });

  @override
  List<Object> get props => [nome];
}
