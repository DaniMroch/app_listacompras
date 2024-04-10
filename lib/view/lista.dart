// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';

class ListaComprasScreen extends StatefulWidget {
  @override
  _ListaComprasScreenState createState() => _ListaComprasScreenState();
}

class _ListaComprasScreenState extends State<ListaComprasScreen> {
  TextEditingController _listaController = TextEditingController();
  TextEditingController _itemController = TextEditingController();
  List<List<String>> _listasDeCompras = [];

  void _criarLista() {
    setState(() {
      _listasDeCompras.add([_listaController.text]);
      _listaController.clear();
    });
  }

  void _adicionarItem(int index, String item) {
    setState(() {
      _listasDeCompras[index].add(item);
    });
  }

  void _removerItem(int indexLista, int indexItem) {
    setState(() {
      _listasDeCompras[indexLista].removeAt(indexItem);
    });
  }

  void _editarItem(int indexLista, int indexItem, String novoItem) {
    setState(() {
      _listasDeCompras[indexLista][indexItem] = novoItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),  
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _listaController,
              decoration: InputDecoration(
                labelText: 'Nome da lista',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _criarLista,
              child: Text('Criar Lista'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Listas de Compras:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _listasDeCompras.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text(
                        'Lista ${_listasDeCompras[index][0]}',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _listasDeCompras[index].length - 1,
                        itemBuilder: (BuildContext context, int itemIndex) {
                          return Dismissible(
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              setState(() {
                                _removerItem(index, itemIndex);
                              });
                            },
                            background: Container(color: Colors.red),
                            child: ListTile(
                              title: Text(_listasDeCompras[index][itemIndex + 1]),
                              trailing: IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      String novoItem = _listasDeCompras[index][itemIndex + 1];
                                      return AlertDialog(
                                        title: Text('Editar Item'),
                                        content: TextField(
                                          onChanged: (value) {
                                            novoItem = value;
                                          },
                                          controller: TextEditingController()..text = _listasDeCompras[index][itemIndex + 1],
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Cancelar'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _editarItem(index, itemIndex + 1, novoItem);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Salvar'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _itemController,
              decoration: InputDecoration(
                labelText: 'Novo item',
              ),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                if (_listasDeCompras.isNotEmpty) {
                  _adicionarItem(_listasDeCompras.length - 1, _itemController.text);
                  _itemController.clear();
                }
              },
              child: Text('Adicionar Item'),
            ),
          ],
        ),
      ),
    );
  }
}
