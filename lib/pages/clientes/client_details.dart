// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClientDetails extends StatelessWidget {
  final Cliente cliente;

  const ClientDetails({
    Key? key,
    required this.cliente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${cliente.nome} (${cliente.id})"),
      ),
    );
  }
}
