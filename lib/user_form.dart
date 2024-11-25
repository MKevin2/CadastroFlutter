import 'package:banco/field_form.dart';
import 'package:banco/user.dart';
import 'package:banco/user_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  bool _obscureText = true;
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void salvar() {
      UserProvider userProvider = UserProvider.of(context) as UserProvider;

      Usuario user = Usuario(
        nome: controllerNome.text,
        email: controllerEmail.text,
        senha: controllerSenha.text,
      );

      int usersLenght = userProvider.users.length;

      userProvider.users.insert(usersLenght, user);

      Navigator.popAndPushNamed(context, "/login");
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tira a bandeira de debug
      title: 'Health Treats | Cadastro', // Título do aplicativo ao ser emulado
      home: Scaffold( // Corpo do aplicativo
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack( //Foi utilizado para possibilitar a sobreposição do texto sobre a imagem
                children: <Widget>[
                  // Chamando a imagem
                  Image.asset(
                    // Caminho da imagem
                    'assets/img/Background.png',
                    // Expande a imagem por todo espaço definido
                    fit: BoxFit.cover,
                    // Utiliza 100% da largura de determinado espaço
                    width: double.infinity,
                    // Altura da imagem
                    height: 430.0,
                  ),

                  // Comando utilizado para definir a posição de algum elemento (Nesse caso o elemento é um Text)
                  const Positioned(
                    // Define a distância do Text para a margem superior
                    top: 40.0,
                    // Define a distância do Text para a margem esquerda
                    left: 30.0,
                    // Criando uma coluna para alocar o Text
                    child: Column(
                      // Alinha o texto à esquerda
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          // Criando o texto que irá se sobrepor a imagem
                          'Bem vindo!',
                          //Estilizando o texto
                          style: TextStyle(
                            //Definido o tamanho da fonte
                            fontSize: 50.0,
                            //Definido a família da fonte
                            fontFamily: 'RedHatDisplay',
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            // Definindo a altura, que servirá como espaçamento de uma linha a outr
                            height: 1.4,
                          ),
                        ),

                        Text(
                          'sign to continue',
                          style: TextStyle(
                            fontSize: 37.0,
                            fontFamily: 'RedHatDisplay',
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            height: 0.5,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Comando utilizado para dar quebras de pixels na tela 
              const SizedBox(height: 50.0),

              // Comando utilizado para ditar que os elementos presentes dentro dele fiquem no centro
              const Center(
                child: Text(
                  'Cadastro',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'RedHatDisplay',
                    fontWeight: FontWeight.bold,
                    color: Color(0XFF353535),
                  ),
                ),
              ),

              Padding(
          padding: const EdgeInsets.all(40.0), // Espaçamento em toda a seção
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Nome de usuário',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'RedHatDisplay',
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF353535),
                ),
              ),
              const SizedBox(height: 10.0), // Ajustando o espaçamento

              TextFormField(
                controller: controllerNome,
                decoration: InputDecoration(
                  labelText: 'Digite aqui...',
                  labelStyle: const TextStyle(
                    color: Color(0xff93B6EE),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE), 
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE),
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 27, 115, 255),
                      width: 1.5,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE),
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (controllerNome) {
                  if (controllerNome == null || controllerNome.isEmpty) {
                    return 'Por favor, insira seu nome.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              const Text(
                'E-mail',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'RedHatDisplay',
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF353535),
                ),
              ),
              const SizedBox(height: 10.0),

              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(
                  labelText: 'Digite aqui...',
                  labelStyle: const TextStyle(
                    color: Color(0xff93B6EE),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE), 
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE), 
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 27, 115, 255),
                      width: 1.5,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE),
                      width: 1.5,
                    ),
                  ),
                ),
                validator: (value) {
                  RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um email.';
                  } else if (!emailRegex.hasMatch(value)) {
                    return 'Email inválido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),

              const Text(
                'Senha',
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: 'RedHatDisplay',
                  fontWeight: FontWeight.w500,
                  color: Color(0XFF353535),
                ),
              ),
              const SizedBox(height: 10.0),

              TextFormField(
                controller: controllerSenha,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  labelText: 'Digite aqui...',
                  labelStyle: const TextStyle(
                    color: Color(0xff93B6EE),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE), 
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE),
                      width: 1.5,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 27, 115, 255),
                      width: 1.5,
                    ),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xff93B6EE),
                      width: 1.5,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: const Color(0xFF93B6EE),
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma senha.';
                  } else if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30.0),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: salvar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff93B6EE),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontFamily: 'RedHatDisplay',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 50.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribui os elementos para as extremidades
                children: <Widget>[
                  GestureDetector( // Captação de gesto para o ícone
                    onTap: () { // Método chamado ao clicar no ícone
                      //Navigator.push(
                        //context,
                        //MaterialPageRoute(builder: (context) => const MenuApp()),
                      //);
                    },
                    child: const Icon( // Chamando um ícone
                      Icons.arrow_back, // Definindo o ícone
                      size: 30.0, // Tamanho do ícone
                      color: Color(0xff93B6EE), // Cor do ícone
                    ),
                  ),

              // Comando para a definição de alinhamento
              Align(
                // Alinhando a posição do elemento
                alignment: Alignment.centerRight,
                child: RichText(  
                  // Comando de texto clicável
                  text: TextSpan(
                    text: 'Já tem uma conta? ',
                    style: const TextStyle(
                      color: Color(0xff93B6EE),
                      fontFamily: 'RedHatDisplay',
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                      decoration: TextDecoration.underline,
                    ),
                      
                    // Ação ao clicar no texto
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        //Navigator.push(
                          // context,
                          // MaterialPageRoute(
                          //  builder: (context) => const Login(),
                          //),
                        //);
                        },
                      ),
                    ),
                  ),
                ]
                ),
])
              )
            ],
          ),
        ),
      ),
    );
  }
}