import 'package:banco/field_form.dart';
import 'package:banco/user.dart';
import 'package:banco/user_provider.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void salvar() {
      UserProvider userProvider = UserProvider.of(context) as
      UserProvider;

      // Instancia a classe user para receber um novo usuário
      Usuario user = Usuario(
        nome: controllerNome.text,
        email: controllerEmail.text,
        senha: controllerSenha.text,
      );

      int usersLenght = userProvider.users.length;

      // Salva um novo usuário
      userProvider.users.insert(usersLenght, user);

      // Busca o usuário salvo
      print(userProvider.users[0].nome);

      Navigator.popAndPushNamed(context, "/login");
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro')
      ),
      body: Center(
        child: Column(
          children: [
            FieldForm(
              label: 'Nome',
              isPassword: false,
              controller: controllerNome,
            ),
            FieldForm(
              label: 'Email',
              isPassword: false,
              controller: controllerEmail,
            ),
            FieldForm(
              label: 'Senha',
              isPassword: true,
              controller: controllerSenha,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: salvar,
                child: Text('Salvar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}