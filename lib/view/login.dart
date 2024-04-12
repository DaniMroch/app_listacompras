// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //chave identificadora do Form
  var formKey = GlobalKey<FormState>();
  //controladores dos Campos de Texto
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.fromLTRB(50, 100, 50, 100),
        color: Colors.white,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              //Imagem de login
              Image.asset(
                'lib/images/perfil.jpg',
                width: 200,
                height: 200,
              ),

              //Campo de texto para inserir email
              TextFormField(
                controller: txtEmail,
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  labelStyle: TextStyle(color: Colors.black38),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
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

              const SizedBox(height: 30),

              // campo de texto para inserir senha
              TextFormField(
                controller: txtSenha,
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
                    return 'Informe a Senha';
                  } else if (value.isEmpty) {
                    return 'Informe a Senha';
                  } else if (value.length < 6) {
                    return 'Senha deve conter no min 6 digitos';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // botao para 'recuperar senha'
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 't3');
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                  ),
                  child: const Text('Recuperar Senha'),
                ),
              ),
              const SizedBox(height: 20),
              // botao para login
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
                  if (formKey.currentState!.validate()) {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Login efetuado'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    });
                    Navigator.pushNamed(
                      context,
                      't4',
                    );
                  } //end if
                },
                child: const Text('Login'),
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Nao tem conta? '),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        't2',
                      );
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Color.fromARGB(210, 83, 51, 158),
                    ),
                    child: Text('Cadastre-se aqui',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
