import 'package:flutter/material.dart';
import 'package:hello_howrld/data/clientes/sqlite_cliente_datasource.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';

class ClientListController extends ChangeNotifier {
  List<Cliente> clientList = [];

  static final ClientListController controller = ClientListController();

  addClient(Cliente cliente) {
    ClientesDataSource.instance.insertCliente(cliente);
    notifyListeners();
  }
}
