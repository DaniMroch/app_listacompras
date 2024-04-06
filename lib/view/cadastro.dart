// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  //var formkey2 = GlobalKey<FormState>();
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
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 50, 50, 100),
        child: Form(
          //key: formkey2,
          child: Column(
            children: [
              Text(
                "Cadastro",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // campo para informar o  email
              TextFormField(
                //controller: txtEmail,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.black38),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),

                // validacao do email
                validator: (value) {
                  if (value == null) {
                    return 'Informe o E-mail';
                  } else if (value.isEmpty) {
                    return 'Informe o E-mail';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              // campo para criar a senha e confirmar a senha criada
              TextFormField(
                //controller: txtSenha,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  labelStyle: TextStyle(color: Colors.black38),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),

                // validacao da senha
                validator: (value) {
                  if (value == null) {
                    return 'Crie uma Senha';
                  } else if (value.isEmpty) {
                    return 'Crie uma Senha';
                  } else if (value.length < 6) {
                    return 'Senha deve conter no min 6 digitos';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                //controller: txtSenha,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirmar senha',
                  labelStyle: TextStyle(color: Colors.black38),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),

                // validacao da senha
                validator: (value) {
                  if (value == null) {
                    return 'Informe a Senha';
                  } else if (value.isEmpty) {
                    return 'Informe a Senha';
                  } else if (value.length < 6) {
                    return 'Senha deve conter no min 6 digitos';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),

              // botao para cadastrar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  minimumSize: Size(200, 50),
                  shadowColor: Colors.deepPurple,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  // chamar os validadores dos campos de texto
                  Navigator.pushNamed(
                    context,
                    't',
                  );
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
