// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Person extends Equatable {
  late int? id;
  final String name;
  final int age;

  Person({
    this.id,
    required this.age,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }

  @override
  String toString() {
    return 'Person{id: $id, name: $name, age: $age}';
  }

  @override
  List<Object?> get props => [id];
}
