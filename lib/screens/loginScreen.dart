import 'package:flutter/material.dart';
import './bulletinScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool login() {
    print(emailController.text);
    print(passwordController.text);
    return true;
  }

  void handleLogin() {
    if (!login()) {
      Navigator.pushReplacementNamed(context, BulletinScreen.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error Logging in'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: Theme.of(context).textTheme.headline5,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Email',
                ),
                controller: emailController,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Password',
                ),
                controller: passwordController,
              ),
              ElevatedButton(
                child: const Text('Login'),
                onPressed: handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
