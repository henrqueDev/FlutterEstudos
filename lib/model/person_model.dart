// ignore: must_be_immutable

import 'package:hello_howrld/data/data_person_constants.dart';
import 'package:hello_howrld/model/person.dart';

class PersonModel extends Person {
  PersonModel({
    id,
    required age,
    required name,
  }) : super(
          id: id,
          name: name,
          age: age,
        );

  factory PersonModel.fromMap(Map<String, Object?> map) {
    return PersonModel(
      id: map[pessoasColumnID],
      age: map[pessoasColumnIdade],
      name: map[pessoasColumnNome],
    );
  }
}
