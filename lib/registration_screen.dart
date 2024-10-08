import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_service.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            ElevatedButton(
              onPressed: () async {
                User? user = await AuthService().registerWithEmailPassword(emailController.text, passwordController.text);
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
