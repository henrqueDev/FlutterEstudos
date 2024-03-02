// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';
import 'package:hello_howrld/pages/clientes/client_list_controller.dart';

class ClientAdd extends StatefulWidget {
  const ClientAdd({super.key});

  @override
  State<ClientAdd> createState() => _ClientAddState();
}

class _ClientAddState extends State<ClientAdd> {
  String nome = "";
  late Float? saldo;
  String numero_celular = "";
  int? instituicao_fk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 1.2,
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                  color: const Color.fromARGB(0, 0, 0, 100),
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                              onChanged: (text) {
                                nome = text;
                              },
                              style: const TextStyle(color: Colors.white),
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.white,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hoverColor: Colors.white,
                                  focusColor: Colors.white,
                                  labelStyle: TextStyle(color: Colors.white),
                                  labelText: "Nome")),
                          const Padding(padding: EdgeInsets.all(8.0)),
                          TextField(
                            onChanged: (text) {
                              numero_celular = text;
                            },
                            style: const TextStyle(color: Colors.white),
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelStyle: TextStyle(color: Colors.white),
                              labelText: "Numero do celular",
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                ClientListController.controller
                                    .addClient(Cliente(
                                  nome: nome,
                                  instituicao_fk: 1,
                                  numero_celular: numero_celular,
                                ));
                              },
                              child: const Text('Cadastrar',
                                  style: TextStyle(color: Colors.white)))
                        ],
                      )))),
        ));
  }
}
