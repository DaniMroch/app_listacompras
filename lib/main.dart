// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace
import 'package:app_listacompras/view/telaitens.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'view/criarlista.dart';
import 'view/login.dart';
import 'view/cadastro.dart';
import 'view/menu.dart';
import 'view/recuperasenha.dart';
import 'view/sobre.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lista de compras',
      //rotas de navegacao
      initialRoute: 't1',
      routes: {
        't1': (context) => Login(),
        't2': (context) => Cadastro(),
        't3': (context) => RecuperaSenha(),
        't4': (context) => Menu(),
        't5': (context) => Sobre(),
        't6': (context) =>
            ListaDeCompras(), //criar lista // adicionar itens na lista
        't8': (context) => Itens(
              listName: '', //telas dos itens adicionados
            ),
      },
    );
  }
}
