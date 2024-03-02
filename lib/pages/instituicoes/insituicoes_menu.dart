import 'package:flutter/material.dart';
import 'package:hello_howrld/pages/app/app_controller.dart';
import 'package:hello_howrld/pages/clientes/client_list.dart';

class InstituicoesMenu extends StatelessWidget {
  const InstituicoesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Icon(
                        Icons.analytics_rounded,
                        color: Color.fromARGB(255, 0, 81, 255),
                        size: 250.0,
                      ),
                      Title(
                          title: "Estatisticas do negócio",
                          color: AppController.instance.isDarkTheme
                              ? Colors.white
                              : Colors.black,
                          child: const Text(
                            "Estatisticas do negócio",
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ))
                    ])),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const ClientList();
                      }));
                    },
                    child: Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          const Icon(
                            Icons.monetization_on_rounded,
                            color: Color.fromARGB(255, 0, 255, 51),
                            size: 250.0,
                          ),
                          Title(
                              title: "Cobranças",
                              color: AppController.instance.isDarkTheme
                                  ? Colors.white
                                  : Colors.black,
                              child: const Text(
                                "Cobranças",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ))
                        ]))),
              ])),
    );
  }
}
