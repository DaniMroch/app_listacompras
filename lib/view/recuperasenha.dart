// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecuperaSenha extends StatelessWidget {
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
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(45, 50, 50, 100),
            child: Form(
              child: Column(
                children: [
                  //Imagem para recuperar senha
                  Image.asset(
                    'lib/images/senha.jpg',
                    width: 200,
                    height: 200,
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  Text(
                    "Esqueceu sua senha?",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Informe o email e enviaremos um link com as instruções para recuperação de senha.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // campo para inserir email para recuperar a senha
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Colors.black38),
                    ),
                  ),
                  SizedBox(height: 20),

                  //botao para enviar
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 99, 71, 165),
                      foregroundColor: Colors.white,
                      minimumSize: Size(200, 50),
                      shadowColor: Colors.deepPurple,
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
                    child: Text('Enviar'),
                  ),
                ],
              ),
            )));
  }
}
