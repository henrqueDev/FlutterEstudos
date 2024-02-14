import 'package:flutter/material.dart';
import 'package:hello_howrld/data/sqlite_person_datasource.dart';
import 'package:hello_howrld/model/person.dart';
import 'package:hello_howrld/model/person_model.dart';

class ClientList extends StatefulWidget {
  const ClientList({super.key});

  @override
  State<ClientList> createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    var rep = PersonDataSource();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/homepage');
            },
            child: const Icon(Icons.keyboard_arrow_left_rounded),
          )
        ],
      ),
      body: FutureBuilder(
        future: rep.getAll(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(snapshot.data![index].name));
            },
          );
        },
      ),
    );
  }
}
