// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/compras.dart';

class CriarLista extends StatefulWidget {
  const CriarLista({super.key});

  @override
  State<CriarLista> createState() => _CriarListaState();
}

class _CriarListaState extends State<CriarLista> {
  //Declaração da lista dinâmica de Contatos
  List<Compras> itens = [];

  @override
  void initState() {
    itens = Compras.preencher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Compras',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        //
        // ListView
        //
        child: ListView.builder(
          //Quantidade de Itens
          itemCount: itens.length,
          //Aparência de cada Item
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.shopping_bag),
                title: Text(itens[index].nome),
                subtitle: Text(itens[index].quantidade),
                onTap: () {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(itens[index].nome)));
                },
                hoverColor: Color.fromARGB(255, 171, 202, 171),
                onLongPress: () {
                  setState(() {
                    itens.removeAt(index);
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
