import 'package:flutter/material.dart';
import 'package:hello_howrld/app_controller.dart';
import 'package:hello_howrld/client_list.dart';
import 'package:hello_howrld/home_page.dart';
import 'package:hello_howrld/login_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  brightness: AppController.instance.isDarkTheme
                      ? Brightness.dark
                      : Brightness.light),
              routes: {
                "/": (context) => const LoginPage(),
                "/homepage": (context) =>
                    const Homepage(title: "Página principal")
              });
        });
  }
  //const Homepage(title: 'Flutter'));
  /*Container(
        child: Center(
            child: Text(title,
                textDirection: TextDirection.ltr,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1), fontSize: 20.0))));*/
}
