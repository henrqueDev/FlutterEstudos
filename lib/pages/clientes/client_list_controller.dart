import 'package:flutter/material.dart';
import 'package:hello_howrld/data/sqlite_cliente_datasource.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClientListController extends ChangeNotifier {
  List<Cliente> clientList = [];

  static final ClientListController controller = ClientListController();

  addClient(Cliente cliente) {
    DataSource.instance.insertCliente(Cliente(nome: "Jao", idade: 16));
    notifyListeners();
  }
}
