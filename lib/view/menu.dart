// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(100, 100, 50, 50),
        child: Column(
          children: [
            //imagem
            Image.asset(
              'lib/images/tenda.png',
            ),
            SizedBox(
              height: 20,
            ),
            //botao para criar lista
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                shadowColor: Colors.deepPurple,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  't6',
                );
              },
              child: const Text('Criar Lista'),
            ),
            //botao sobre
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                shadowColor: Colors.deepPurple,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  't5',
                );
              },
              child: const Text('Sobre'),
            ),

            //botao sair
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                minimumSize: Size(200, 50),
                shadowColor: Colors.deepPurple,
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                  't1',
                );
              },
              child: const Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}
