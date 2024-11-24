import 'package:banco/home.dart';
import 'package:banco/login.dart';
import 'package:banco/user_form.dart';
import 'package:banco/user_provider.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UserProvider( // Precisa envolver toda a aplicação
      child: MaterialApp(
        title: 'CRUP APP',
        home: UserForm(),
        routes: {
          "/create": (_) => UserForm(),
          "/home": (context) => HomeScreen(),
          "/login": (context) => LoginScreen(),
        },
      ),
    );
  }
}
