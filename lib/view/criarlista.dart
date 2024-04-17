// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'telaitens.dart';

class ListaDeCompras extends StatefulWidget {
  @override
  ListaDeComprasState createState() => ListaDeComprasState();
}

class ListaDeComprasState extends State<ListaDeCompras> {
  List<String> listas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text('Lista de Compras'),
      ),
      body: Column(
        children: [
          //aparecer as listas criadas na tela
          Expanded(
            child: ListView.builder(
              itemCount: listas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listas[index],
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  leading: IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      editarLista(index);
                    },
                  ), // Adicione o ícone aqui
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      deletarLista(index);
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      //ir para a tela de itens
                      context,
                      MaterialPageRoute(
                        builder: (context) => Itens(listName: listas[index]),
                      ),
                    );
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
                adicionarLista();
              },
              child: Text('Criar Nova Lista'),
            ),
          ),
        ],
      ),
    );
  }

  void adicionarLista() {
    showDialog(
      context: context,
      builder: (context) {
        String novaLista = '';
        return AlertDialog(
          title: Text('Nova Lista de Compras'),
          content: TextField(
            onChanged: (value) {
              novaLista = value;
            },
            decoration: InputDecoration(hintText: 'Nome da Lista'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listas.add(novaLista);
                });
                Navigator.pop(context);
              },
              child: Text('Criar'),
            ),
          ],
        );
      },
    );
  }

  void deletarLista(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Excluir Lista'),
          content: Text('Deseja excluir a lista "${listas[index]}"?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listas.removeAt(index);
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

  void editarLista(int index) {
    showDialog(
      context: context,
      builder: (context) {
        String listaEditada = listas[index];
        return AlertDialog(
          title: Text('Editar Item'),
          content: TextField(
            onChanged: (value) {
              listaEditada = value;
            },
            decoration: InputDecoration(hintText: 'Nome do Item'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  listas[index] = listaEditada;
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
