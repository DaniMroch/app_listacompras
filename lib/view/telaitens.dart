// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Itens extends StatefulWidget {
  final String listName;

  Itens({required this.listName});

  @override
  ItensState createState() => ItensState();
}

class ItensState extends State<Itens> {
  List<String> itens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: itens.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(itens[index]),
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      editarItem(index);
                    },
                  ),
                  trailing: Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  onLongPress: () {
                    deletarItem(index);
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                shadowColor: Colors.deepPurple,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                adicionarItem();
              },
              child: Text('Adicionar Item'),
            ),
          ),
        ],
      ),
    );
  }

  void adicionarItem() {
    showDialog(
      context: context,
      builder: (context) {
        String newItem = '';
        return AlertDialog(
          title: Text('Novo Item'),
          content: TextField(
            onChanged: (value) {
              newItem = value;
            },
            decoration: InputDecoration(hintText: 'Nome do Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  itens.add(newItem);
                });
                Navigator.pop(context);
              },
              child: Text('Adicionar'),
            ),
          ],
        );
      },
    );
  }

  void deletarItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir Item'),
          content: Text('Deseja excluir o item "${itens[index]}"?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  itens.removeAt(index);
                });
                Navigator.pop(context);
              },
              child: Text('Excluir'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  void editarItem(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String itemEditado = itens[index];
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            onChanged: (value) {
              itemEditado = value;
            },
            decoration: InputDecoration(hintText: 'Nome do Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  itens[index] = itemEditado;
                });
                Navigator.pop(context);
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }
}
