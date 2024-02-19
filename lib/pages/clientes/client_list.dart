import 'package:flutter/material.dart';
import 'package:hello_howrld/pages/clientes/client_details.dart';
import 'package:hello_howrld/data/sqlite_cliente_datasource.dart';
import 'package:hello_howrld/model/cliente/cliente.dart';
import 'package:hello_howrld/model/cliente/cliente_model.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  DataSource db = DataSource();
  List<ClienteModel> rep = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<List<ClienteModel>> _getData() async {
    return await db.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Clientes")),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.data?[index] != null) {
                Cliente cliente = snapshot.data![index];
                return ListTile(
                  title: Text("${cliente.nome}id - ${cliente.id}"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ClientDetails(cliente: cliente);
                    }));
                  },
                );
              }
              return null;
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: "add",
        backgroundColor: Colors.green,
        onPressed: () async {
          DataSource d = DataSource();
          await d.insertCliente(Cliente(nome: "Jao", idade: 16));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}