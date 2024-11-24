import 'package:banco/user.dart';
import 'package:flutter/material.dart';
import 'package:banco/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  void login() {
    UserProvider userProvider = UserProvider.of(context) as UserProvider;

    final usuario = userProvider.users.firstWhere(
      (user) => user.email == controllerEmail.text && user.senha == controllerSenha.text,
    );


    if (usuario != null) {
      Navigator.pushNamed(context, "/home"); // Navega para a tela principal
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Erro"),
          content: Text("Email ou senha inválidos."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Ok"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Center(
        child: Column(
          children: [
            TextField(
              controller: controllerEmail,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: controllerSenha,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: login,
                child: Text('Entrar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
