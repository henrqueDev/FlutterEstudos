// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:hello_howrld/model/person.dart';

class ClientDetails extends StatelessWidget {
  final Person person;

  const ClientDetails({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${person.name} (${person.id})"),
      ),
    );
  }
}
