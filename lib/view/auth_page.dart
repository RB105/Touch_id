import 'package:flutter/material.dart';
import 'package:touch_idapp/view/auth_button.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Local Auth Example'),
        ),
        body: const Center(
          child: AuthButton(),
        ));
  }
}
