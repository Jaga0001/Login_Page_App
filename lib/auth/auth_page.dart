import 'package:flutter/material.dart';
import 'package:loginui/pages/login.dart';
import 'package:loginui/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool showLoginPage = true;

  void toggleScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return Login(showRegisterPage: toggleScreen,);
    } else {
      return RegisterPage(showLoginPage: toggleScreen,);
    }
  }
}