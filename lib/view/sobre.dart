// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
          color: Color.fromARGB(255, 255, 174, 68),
          child: Form(
            child: Column(
              children: [
                Text(
                  "Sobre App",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Aplicativo com o tema lista de compras, desenvolvido a fim de criar uma lista e armazenar os itens e suas quantidades assim contribuindo para organizacao pessoal do usuario, \nCriado por: Daniela R.",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
