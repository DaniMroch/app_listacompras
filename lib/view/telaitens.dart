// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Itens extends StatefulWidget {
  final String listName;

  Itens({required this.listName});

  @override
  ItensState createState() => ItensState();
}

class ItensState extends State<Itens> {
  bool check = false; // estado inicial do checkbox
  List<Map<String, dynamic>> itens =
      []; // Modifica a lista para armazenar objetos com nome e quantidade

  //List<String> itens = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listName,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
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
                  title: Text(
                      '${itens[index]['nome']} (${itens[index]['quantidade']})'), // Exibe o nome seguido da quantidade
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      editarItem(index);
                    },
                  ),
                  trailing: Checkbox(
                    value: check,
                    onChanged: (newValue) {
                      setState(() {
                        if (check) {
                          check = false;
                        } else {
                          check = true;
                        }
                      });
                    },
                  ),
                  onLongPress: () {
                    deletarItem(index);
                  },
                );
              },
            ),
          ),
          Text(
            "Pressione o item para Excluir",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
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
        String novoItem = '';
        int quantidade = 0; // Inicializa a quantidade com 0
        return AlertDialog(
          title: Text('Novo Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  novoItem = value;
                },
                decoration: InputDecoration(hintText: 'Nome do Item'),
              ),
              TextField(
                onChanged: (value) {
                  quantidade = (int.tryParse(value) ?? 0);
                  // Se a conversão falhar, mantém a quantidade como 0
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Quantidade'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Adiciona o novo item com sua quantidade à lista
                  itens.add({'nome': novoItem, 'quantidade': quantidade});
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
          content: Text(
              'Deseja excluir o item "${itens[index]['nome']}"?'), // Acessa o nome do item no índice especificado
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
    String itemEditado =
        itens[index]['nome']; // Obtém o nome do item no índice especificado
    int quantidadeEditada = itens[index]
        ['quantidade']; // Obtém a quantidade do item no índice especificado

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  itemEditado = value;
                },
                decoration: InputDecoration(hintText: 'Novo Nome do Item'),
              ),
              TextField(
                onChanged: (value) {
                  quantidadeEditada = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Nova Quantidade'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  // Atualiza o nome e a quantidade do item no índice especificado
                  itens[index]['nome'] = itemEditado;
                  itens[index]['quantidade'] = quantidadeEditada;
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
