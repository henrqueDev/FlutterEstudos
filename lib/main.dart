// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hello_howrld/pages/app/app_widget.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future main() async {
  if (Platform.isWindows || Platform.isLinux) {
    sqfliteFfiInit();
  }

  databaseFactory = databaseFactoryFfi;
  runApp(AppWidget());
}
