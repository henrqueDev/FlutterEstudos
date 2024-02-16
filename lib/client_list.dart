import 'package:flutter/material.dart';
import 'package:hello_howrld/client_details.dart';
import 'package:hello_howrld/data/sqlite_person_datasource.dart';
import 'package:hello_howrld/model/person.dart';
import 'package:hello_howrld/model/person_model.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  PersonDataSource db = PersonDataSource();
  List<PersonModel> rep = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<List<PersonModel>> _getData() async {
    return await db.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Clientes"),
      ),
      body: FutureBuilder(
        future: _getData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              if (snapshot.data?[index] != null) {
                Person client = snapshot.data![index];
                return ListTile(
                  title: Text("${client.name}id - ${client.id}"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ClientDetails(person: client);
                    }));
                  },
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
